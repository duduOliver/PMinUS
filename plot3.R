library("reshape2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmissions1999inPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "POINT"),  ]$Emissions)
totalEmissions2002inPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "POINT"),  ]$Emissions)
totalEmissions2005inPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "POINT"),  ]$Emissions)
totalEmissions2008inPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "POINT"),  ]$Emissions)
totalEmissions1999inNONPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "NONPOINT"),  ]$Emissions)
totalEmissions2002inNONPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "NONPOINT"),  ]$Emissions)
totalEmissions2005inNONPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "NONPOINT"),  ]$Emissions)
totalEmissions2008inNONPOINT <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "NONPOINT"),  ]$Emissions)
totalEmissions1999inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2002inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2005inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions2008inONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "ON-ROAD"),  ]$Emissions)
totalEmissions1999inNONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 1999 & NEI$type == "NON-ROAD"),  ]$Emissions)
totalEmissions2002inNONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2002 & NEI$type == "NON-ROAD"),  ]$Emissions)
totalEmissions2005inNONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2005 & NEI$type == "NON-ROAD"),  ]$Emissions)
totalEmissions2008inNONROAD <- sum(NEI[(NEI$fips == "24510" & NEI$year == 2008 & NEI$type == "NON-ROAD"),  ]$Emissions)

years <- rep(c(1999,2002,2005,2008),each=4)
types <- rep(c("POINT","NONPOINT","ON-ROAD", "NON-ROAD"), 4)
emissions <- c(totalEmissions1999inPOINT, totalEmissions1999inNONPOINT, totalEmissions1999inONROAD, totalEmissions1999inNONROAD,
totalEmissions2002inPOINT, totalEmissions2002inNONPOINT, totalEmissions2002inONROAD, totalEmissions2002inNONROAD,
totalEmissions2005inPOINT, totalEmissions2005inNONPOINT, totalEmissions2005inONROAD, totalEmissions2005inNONROAD,
totalEmissions2008inPOINT, totalEmissions2008inNONPOINT, totalEmissions2008inONROAD, totalEmissions2008inNONROAD)
totalEmissions <- data.frame(types)
totalEmissions <- cbind(totalEmissions, years, emissions)

png(file = "plot3.png", width = 480, height = 480, units="px",bg = "white")
g <- ggplot(data=totalEmissions, aes(x=years, y=emissions, group = types, colour = types)) 
g + geom_line() + ggtitle("Emissions for Baltimore in Years in Types") + xlab("Yesrs") + ylab("Emission in Tons")
dev.off() 
