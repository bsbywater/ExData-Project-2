library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore<-subset(NEI, NEI$fips==24510) 
baltimoreyeartypetotals <- aggregate(Emissions ~ year + type, baltimore, sum)
png("plot3.png", width=640, height=480)
ggplot(data=baltimoreyeartypetotals,aes(year,Emissions,color=type))+geom_line(size=1.25) +
       xlab("Year") + 
       ylab("Emissions") + 
       ggtitle("Total PM2.5 Emissions in Baltimore, MD from 1999 to 2008") 
dev.off()