library("reshape2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BtotalEmissions1999inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "ON-ROAD"),  ]$Emissions)
BtotalEmissions2002inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "ON-ROAD"),  ]$Emissions)
BtotalEmissions2005inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "ON-ROAD"),  ]$Emissions)
BtotalEmissions2008inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "ON-ROAD"),  ]$Emissions)
AtotalEmissions1999inONROAD <- sum(NEI[(NEI$fips == "06037" & NEI$year == 1999 & NEI$type == "ON-ROAD"),  ]$Emissions)
AtotalEmissions2002inONROAD <- sum(NEI[(NEI$fips == "06037" & NEI$year == 2002 & NEI$type == "ON-ROAD"),  ]$Emissions)
AtotalEmissions2005inONROAD <- sum(NEI[(NEI$fips == "06037" & NEI$year == 2005 & NEI$type == "ON-ROAD"),  ]$Emissions)
AtotalEmissions2008inONROAD <- sum(NEI[(NEI$fips == "06037" & NEI$year == 2008 & NEI$type == "ON-ROAD"),  ]$Emissions)

cityType <- rep(c("Baltimore", "Los Angeles"), each = 3)
yearPeroid <- rep(c("1999-2002","2002-2005","2005-2008"), 2)
emissionsChangingRate <- c((BtotalEmissions2002inONROAD/BtotalEmissions1999inONROAD) - 1, (BtotalEmissions2005inONROAD/BtotalEmissions2002inONROAD) - 1, 
				   (BtotalEmissions2008inONROAD/BtotalEmissions2005inONROAD) - 1, (AtotalEmissions2002inONROAD/AtotalEmissions1999inONROAD) - 1, 
				   (AtotalEmissions2005inONROAD/AtotalEmissions2002inONROAD) - 1, (AtotalEmissions2008inONROAD/AtotalEmissions2005inONROAD) - 1)
totalEmissions <- data.frame(yearPeroid, cityType, emissionsChangingRate)

png(file = "plot6.png", width = 720, height = 480, units="px",bg = "white")
g <- ggplot(data=totalEmissions, aes(x=yearPeroid, y=emissionsChangingRate, group = cityType, colour = cityType))
g + geom_line() + ggtitle("Comparison of Motor Vehicle Emissions in  Baltimore and Los Angeles") + xlab("Yesr Peroid") + ylab("Emission Changing Rate")
dev.off() 


