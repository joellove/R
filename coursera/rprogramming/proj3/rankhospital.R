source("best.R")

rankhospital <- function(state, outcome, num = "best") {
    
    ## Init
    hospitalNameColIdx <- 2
    stateColIdx <- 7
    outcomes <- c('heart attack', 'heart failure', 'pneumonia')  
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
    ## Check that state and outcome are valid
    best(state, outcome)
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate

    ## set outcome column index
    if(outcome == outcomes[1]) outColIdx <- 11
    else if(outcome == outcomes[2] ) outColIdx <- 17
    else if(outcome == outcomes[3] ) outColIdx <- 23
    
    suppressWarnings(data[,outColIdx] <- as.numeric(data[,outColIdx]))
    subData <- subset(data, data[,stateColIdx] == state, select = c(hospitalNameColIdx,outColIdx))
    
    ## If there is a tie for the same rate for a given outcome, 
    ## then the hospital names should be sorted in alphabetical order 
    rowNum <- order(subData[,2], subData[,1], na.last=NA)
    
    if(num == "best") rank <- 1
    else if(num == "worst") rank <- length(rowNum)
    else rank <- num
    
    rank <- as.numeric(rank)

    ## result
    subData[rowNum,]$Hospital.Name[rank]
}

#Test Result
#> source("rankhospital.R")
#> rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"
#> rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"
#> rankhospital("MN", "heart attack", 5000)
#[1] NA
