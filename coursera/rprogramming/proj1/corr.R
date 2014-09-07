setwd("c:\\Teradata\\04.study\\Data Scientist\\Coursera\\R_Programming\\work\\")

corr <- function(directory, threshold = 0){
  
  #extract completely observed cases
  cases = complete(directory, id=1:332)
  
  #monitor locations where the number of completely observed cases 
  #is greater than threshold
  valid <- cases[,2] >= threshold
  
  ##validCases = cbind(cases[,1][valid],cases[,2][valid])
  validID = cases[,1][valid]
    
  result<-c()
  
  for(i in validID){
    
    #make file path
    file <- paste(directory,"/", sprintf("%03d", as.numeric(i)), ".csv" , sep="")
    
    csv = read.csv(file)
    sulfate <- csv$sulfate
    nitrate <- csv$nitrate
    
    #calculates the correlation between sulfate and nitrate 
    result <- c(result, cor(sulfate[complete.cases(sulfate, nitrate)],
                            nitrate[complete.cases(sulfate, nitrate)]))
  }
  return(result)
}

## source("complete.R")
## source("corr.R")
cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323
