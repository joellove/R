##Questions 2

setwd("~/Documents/BigData/coursera/exploratory_da/week3/assignment2")


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#install.packages('Hmisc')
#library(Hmisc)
summary(NEI)
describe(NEI)

MD <- subset(NEI, fips=='24510')

##Plot
barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

##Save the file
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
