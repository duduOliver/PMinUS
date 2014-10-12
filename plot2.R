NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Emission1999atBaltimore <- NEI[(NEI$fips == "24510" & NEI$year == 1999), ]
Emission2002atBaltimore <- NEI[(NEI$fips == "24510" & NEI$year == 2002), ]
Emission2005atBaltimore <- NEI[(NEI$fips == "24510" & NEI$year == 2005), ]
Emission2008atBaltimore <- NEI[(NEI$fips == "24510" & NEI$year == 2008), ]
totalEmissions1999atBaltimore <- sum(Emission1999atBaltimore$Emissions)/(10^6)
totalEmissions2002atBaltimore <- sum(Emission2002atBaltimore$Emissions)/(10^6)
totalEmissions2005atBaltimore <- sum(Emission2005atBaltimore$Emissions)/(10^6)
totalEmissions2008atBaltimore <- sum(Emission2008atBaltimore$Emissions)/(10^6)
Emissions <- c(totalEmissions1999atBaltimore, totalEmissions2002atBaltimore, totalEmissions2005atBaltimore, totalEmissions2008atBaltimore)
year <- c(1999, 2002, 2005, 2008)
totalEmissionPerYearatBaltimore <- data.frame(Emissions,year)

png(file = "plot2.png", width = 480, height = 480, units="px",bg = "white")
plot(totalEmissionPerYearatBaltimore$year, totalEmissionPerYearatBaltimore$Emissions, type="l", main = "Total Emissions Per Year at Baltimore", xlab="year", ylab="total PM2.5 emission per year at Baltimore (Million tons)", xaxt="n")
axis(side = 1, at = seq(1999, 2008, by = 3))
dev.off() 