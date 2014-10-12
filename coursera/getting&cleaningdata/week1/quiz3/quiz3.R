setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week1\\quiz3")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

if(!file.exists("data")){
    dir.create("data")
}

download.file(fileURL, destfile="./data/gov_NGAP.xlsx", mode="wb", method="internal")
list.files("./data")
downloaded <- date()

install.packages("xlsx")
library(xlsx)

rowIndex <- 18:23
colIndx <- 7:15

dat <- read.xlsx(file="./data/gov_NGAP.xlsx",sheetIndex=1,colIndex=colIndx,startRow=18, endRow=23, header=TRUE)
head(dat)

sum(dat$Zip*dat$Ext,na.rm=T)
