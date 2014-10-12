setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week1\\quiz4")

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

#install.packages(XML)
library(XML)

doc <- xmlTreeParse(fileURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)

length(zipcode[zipcode==21231])
