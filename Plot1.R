NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
yeartotals <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png")
barplot(yeartotals, main = "Total PM2.5 Emissions by Year", xlab="Year", ylab="Emissions", col="navy")
dev.off()