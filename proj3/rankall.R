source("rankhospital.R")

rankall <- function(outcome, num = "best") {
    
    ## Init
    hospitalNameColIdx <- 2
    stateColIdx <- 7
    outcomes <- c('heart attack', 'heart failure', 'pneumonia')  
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
    ## Check that state and outcome are valid
    if (!outcome %in% outcomes) stop('invalid outcome')

    ## set outcome column index
    if(outcome == outcomes[1]) outColIdx <- 11
    else if(outcome == outcomes[2] ) outColIdx <- 17
    else if(outcome == outcomes[3] ) outColIdx <- 23
    
    suppressWarnings(data[,outColIdx] <- as.numeric(data[,outColIdx]))

    ## For each state, find the hospital of the given rank
    state <- levels(factor(data$State))
    hospital <- sapply(state, outcome=outcome, num=num, rankhospital)
    result <- data.frame(hospital, state)
     
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    invisible(result)
}

#Test Result
#> source("rankall.R")
#> head(rankall("heart attack", 20), 10)
#hospital state
#AK <NA> AK
#AL D W MCMILLAN MEMORIAL HOSPITAL AL
#AR ARKANSAS METHODIST MEDICAL CENTER AR
#AZ JOHN C LINCOLN DEER VALLEY HOSPITAL AZ
#CA SHERMAN OAKS HOSPITAL CA
#CO SKY RIDGE MEDICAL CENTER CO
#CT MIDSTATE MEDICAL CENTER CT
#DC <NA> DC
#DE <NA> DE
#FL SOUTH FLORIDA BAPTIST HOSPITAL FL
#> tail(rankall("pneumonia", "worst"), 3)
#hospital state
#WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC WI
#WV PLATEAU MEDICAL CENTER WV
#WY NORTH BIG HORN HOSPITAL DISTRICT WY
#> tail(rankall("heart failure"), 10)
#hospital state
#TN WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL TN
#TX FORT DUNCAN MEDICAL CENTER TX
#UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER UT
#VA SENTARA POTOMAC HOSPITAL VA
#VI GOV JUAN F LUIS HOSPITAL & MEDICAL CTR VI
#VT SPRINGFIELD HOSPITAL VT
#WA HARBORVIEW MEDICAL CENTER WA
#WI AURORA ST LUKES MEDICAL CENTER WI
#WV FAIRMONT GENERAL HOSPITAL WV
#WY CHEYENNE VA MEDICAL CENTER WY