library("reshape2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmissions1999inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2002inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2005inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2008inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "ON-ROAD"),  ]$Emissions)

years <- c(1999,2002,2005,2008)
emissions <- c(totalEmissions1999inONROAD, totalEmissions2002inONROAD, totalEmissions2005inONROAD, totalEmissions2008inONROAD)
totalEmissions <- data.frame(years, emissions)

png(file = "plot5.png", width = 480, height = 480, units="px",bg = "white")
g <- ggplot(data=totalEmissions, aes(x=years, y=emissions))
g + geom_line() + ggtitle("Emissions for Baltimore in Years in Motor Vehicles") + xlab("Yesrs") + ylab("Emission in Tons")
dev.off() 
