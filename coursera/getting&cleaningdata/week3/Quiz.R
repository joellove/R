# Quiz 3.

# Problem 1.
library(sqldf)
setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week3")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
             
if(!file.exists("data")){
    dir.create("data")
}

download.file(fileURL, destfile="./data/getdata-data-ss06hid.csv", mode="wb", method="internal")
acs <- read.csv("./data/getdata-data-ss06hid.csv", header=T, sep=",")
head(acs)
# households on greater than 10 acres who sold more than $10,000 worth of agriculture products
# ACR=3 AND AGS=6
agricultureLogical<-(acs$ACR==3 & acs$AGS==6)
which(agricultureLogical)
class(agricultureLogical)



# Problem 2.
install.packages("jpeg")
library(jpeg)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = "./data/jeff.jpg", mode="wb", method="internal")
img.n<-readJPEG("./data/jeff.jpg",TRUE)
quantile(img.n,probs=c(0.3,0.8))



# Problem 3.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/gdp.csv", mode="wb", method = "internal")
gdp <- read.csv("./data/gdp.csv")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "./data/edu.csv", mode="wb", method = "internal")
edu <- read.csv("./data/edu.csv")
#X=CountryCode
names(gdp)
names(edu)
head(gdp)
head(edu)
gdpclean<-gdp[5:194,]
mergedData=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
mergedData$Gross.domestic.product.2012 = as.numeric(as.character(mergedData$Gross.domestic.product.2012))
str(mergedData)
levels(mergedData$Income.Group)
attributes(edu$CountryCode)
#sort(mergedData$Gross.domestic.product.2012,decreasing=TRUE)
orderedData <- mergedData[order(mergedData$Gross.domestic.product.2012,decreasing=TRUE),]



# Problem 4.
#summary(mergedData[mergedData$Income.Group=="High income: OECD",])
#with : subquery ÇÔ¼ö
nonOECD = with(mergedData, Gross.domestic.product.2012[Income.Group == "High income: nonOECD"])
OECD = with(mergedData, Gross.domestic.product.2012[Income.Group == "High income: OECD"])

mean(nonOECD, na.rm=TRUE) 
mean(OECD, na.rm=TRUE) 



# Problem 5.
quantile(mergedData$Gross.domestic.product.2012, probs=c(0.2,0.4,0.6,0.8,1))
#install.packages("Hmisc")
library(Hmisc)
#mergedData$gdp=cut2(mergedData$Gross.domestic.product.2012,g=5)
table(mergedData$Income.Group,mergedData$Gross.domestic.product.2012)

attributes(mergedData$Income.Group)
levels(gdp$Gross.domestic.product.2012)
result = subset(mergedData, Income.Group == "Lower middle income") 
str(result)

as.numeric(mergedData$Gross.domestic.product.2012)
orderResult <- result[order(result$Gross.domestic.product.2012),]



