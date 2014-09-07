setwd("c:\\Teradata\\04.study\\Data Scientist\\Coursera\\R_Programming\\work\\")

pollutantmean <- function(directory, pollutant, id=1:332){
  
  myData <- c()
  
  for(i in id){

    #make file path
    file <- paste(directory,"/", sprintf("%03d", as.numeric(i)), ".csv" , sep="")
    
    csv = read.csv(file)
    tmp = csv[,pollutant]

    #removing NA values
    #good <- complete.cases(tmp)
    good <- tmp[!is.na(tmp)]

    #add values
    myData <- c(myData, good)
  }

  mean(myData)
}

##source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
pollutantmean("specdata", "nitrate", 23)
## [1] 1.281