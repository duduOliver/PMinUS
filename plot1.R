NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Emission1999 <- NEI[NEI$year == 1999, ]
Emission2002 <- NEI[NEI$year == 2002, ]
Emission2005 <- NEI[NEI$year == 2005, ]
Emission2008 <- NEI[NEI$year == 2008, ]
totalEmissions1999 <- sum(Emission1999$Emissions)/(10^6)
totalEmissions2002 <- sum(Emission2002$Emissions)/(10^6)
totalEmissions2005 <- sum(Emission2005$Emissions)/(10^6)
totalEmissions2008 <- sum(Emission2008$Emissions)/(10^6)
Emissions <- c(totalEmissions1999, totalEmissions2002, totalEmissions2005, totalEmissions2008)
year <- c(1999, 2002, 2005, 2008)
totalEmissionPerYear <- data.frame(Emissions,year)

png(file = "plot1.png", width = 480, height = 480, units="px",bg = "white")
plot(totalEmissionPerYear$year, totalEmissionPerYear$Emissions, type="l", main = "Total Emissions Per Year", xlab="year", ylab="total PM2.5 emission per year(Million tons)", xaxt="n")
axis(side = 1, at = seq(1999, 2008, by = 3))
dev.off() 