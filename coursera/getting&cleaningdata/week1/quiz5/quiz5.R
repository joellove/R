setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week1\\quiz5")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

if(!file.exists("data")){
    dir.create("data")
}

download.file(fileURL, destfile="./data/fsspid.csv", mode="wb", method="internal")
list.files("./data")
downloaded <- date()
print(downloaded)
library(data.table)

DT <- fread(input="./data/fsspid.csv", sep=",")
system.time(DT[,mean(pwgtp15),by=SEX])
#사용자  시스템 elapsed 
#0.02    0.00    0.02 

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
#사용자  시스템 elapsed 
#0.02    0.00    0.02 

system.time(mean(DT$pwgtp15,by=DT$SEX))
#사용자  시스템 elapsed 
#0    0    0 

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
#사용자  시스템 elapsed 
#0    0    0 

system.time(mean(DT[DT$SEX==1,]$pwgtp15))
#사용자  시스템 elapsed 
#0.03    0.00    0.04 

system.time(mean(DT[DT$SEX==2,]$pwgtp15))
#사용자  시스템 elapsed 
#0.03    0.00    0.03 

#system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
