NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assuming type 'On-Road' can be used for Motor Vehicle source
BaltimoreCar <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

BaltimoreCaryeartotals <- tapply(BaltimoreCar$Emissions, BaltimoreCar$year, sum)

png("plot5.png",width=640, height=480)
barplot(BaltimoreCaryeartotals, main = "Total PM2.5 Emissions by Year for On-Road Sources for Baltimore, MD", xlab="Year", ylab="Emissions", col="navy")
dev.off()