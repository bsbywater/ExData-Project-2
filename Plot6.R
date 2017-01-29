NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assuming type 'On-Road' can be used for Motor Vehicle source
MD_CA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

TotalByYearAndFips <- aggregate(Emissions ~ year + fips, MD_CA, sum)

City_names <- c(
                 `24510` = "Baltimore, MD",
                 `06037` = "Los Angeles, CA")

png("plot6.png",width=640, height=480)
ggplot(data=TotalByYearAndFips,aes(factor(year),Emissions,fill=year))+
      facet_grid(. ~ fips,labeller = as_labeller(City_names)) +
      geom_bar(stat="identity") +     
      xlab("Year") + 
      ylab("Emissions") + 
      ggtitle("Total PM2.5 Emissions in 1999 to 2008 for Baltimore and Los Angeles") +
      guides(fill=FALSE)
dev.off()