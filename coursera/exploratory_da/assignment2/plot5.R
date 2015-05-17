##Questions 5

setwd("~/Documents/BigData/coursera/exploratory_da/week3/assignment2")


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#install.packages('Hmisc')
#library(Hmisc)
summary(NEI)
describe(NEI)

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

##Plot
require(ggplot2)
ggplot(data=MD.df, aes(x=year, y=Emissions)) + 
    geom_bar(stat="identity", aes(fill=year)) +
    guides(fill=F) + 
    ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

##Save the file
dev.copy(png, file="plot5.png", height=480, width=480) 
dev.off() 
