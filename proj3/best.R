best <- function(state, outcome) {
    hospitalNameColIdx <- 2
    stateColIdx <- 7
        
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")

    ## Check that state and outcome are valid
    if(nrow(subset(data, data[,stateColIdx] == state, select = State)) <= 0){
        stop("invalid state")
        return
    }
    
    if(outcome != "heart attack" 
       && outcome != "heart failure" 
       && outcome != "pneumonia"){
        stop("invalid outcome")
        return
    }
        
    ## Return hospital name in that state with lowest 30-day death rate
    if(outcome == "heart attack"){
        outColIdx <- 11
    }else if(outcome == "heart failure" ){
        outColIdx <- 17
    }else if(outcome == "pneumonia" ){
        outColIdx <- 23
    }

    suppressWarnings(data[,outColIdx] <- as.numeric(data[,outColIdx]))
    subData <- subset(data, data[,stateColIdx] == state, select = c(hospitalNameColIdx,outColIdx))
    
    #rowNum <- which.min(subData[,2])
    
    ## If there is a tie for the best hospital for a given outcome, 
    ## then the hospital names should be sorted in alphabetical order 
    rowNum <- order(subData[,2], subData[,1])
    subData[rowNum,]$Hospital.Name[1]
}

#> source("best.R")
#> best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#> best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
#> best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
#> best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
#> best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
#> best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome
