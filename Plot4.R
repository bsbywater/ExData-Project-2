NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_SCC<-merge(NEI, SCC, by = "SCC")

SCC_Coal  <- grepl("Coal", NEI_SCC$Short.Name, ignore.case=TRUE)
CoalSubset <- NEI_SCC[SCC_Coal, ]

yeartotals <- tapply(CoalSubset$Emissions, CoalSubset$year, sum)

png("plot4.png",width=640, height=480)
barplot(yeartotals, main = "Total PM2.5 Emissions by Year from Coal Combustion Sources", xlab="Year", ylab="Emissions", col="navy")

dev.off()