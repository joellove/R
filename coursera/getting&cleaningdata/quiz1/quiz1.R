setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\quiz1")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if(!file.exists("data")){
    dir.create("data")
}
download.file(fileURL, destfile="./data/communities.csv", method="curl")
list.files("./data")
downloaded <- date()

communityData <- read.table("./data/communities.csv", sep=",", header=TRUE)
head(communityData)

