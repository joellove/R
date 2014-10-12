setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week1\\quiz1")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

if(!file.exists("data")){
    dir.create("data")
}

download.file(fileURL, destfile="./data/communities.csv", method="internal")
list.files("./data")
downloaded <- date()

communityData <- read.table("./data/communities.csv", sep=",", header=TRUE)
head(communityData)

#Code book says VAL with 24 represents any house more than $1000000. 
#Following piece of code is trying to get count on house price >$1000000 whose value is not NA
length(communityData$VAL[!is.na(communityData$VAL) & communityData$VAL==24])
