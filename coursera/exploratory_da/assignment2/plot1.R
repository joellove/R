##Questions 1

setwd("~/Documents/BigData/coursera/exploratory_da/week3/assignment2")


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

install.packages('Hmisc')
library(Hmisc)
summary(NEI)
describe(NEI)

Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

##Plot
barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM',''[2.5], 'in Kilotons'))) 

##Save the file
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
