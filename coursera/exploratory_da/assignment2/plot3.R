##Questions 3

setwd("~/Documents/BigData/coursera/exploratory_da/week3/assignment2")


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#install.packages('Hmisc')
#library(Hmisc)
summary(NEI)
describe(NEI)

MD <- subset(NEI, fips=='24510')
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

##Plot
require(ggplot2)
ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
    geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
    ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
    ggtitle('Emissions per Type in Baltimore City, Maryland') +
    geom_jitter(alpha=0.10)

##Save the file
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 
