NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCList <- data.frame(SCC[grepl("Coal", SCC$EI.Sector, ignore.case=T),]$SCC)
SCCList <- data.frame(lapply(SCCList, as.character), stringsAsFactors=FALSE)
names(SCCList) <- "SCC"
mergedData <- merge(SCCList, NEI, by.x="SCC", by.y="SCC", all=FALSE)

Emission1999FromCoal <- mergedData[mergedData$year == 1999, ]
Emission2002FromCoal <- mergedData[mergedData$year == 2002, ]
Emission2005FromCoal <- mergedData[mergedData$year == 2005, ]
Emission2008FromCoal <- mergedData[mergedData$year == 2008, ]
totalEmissions1999FromCoal <- sum(Emission1999FromCoal$Emissions)/(10^6)
totalEmissions2002FromCoal <- sum(Emission2002FromCoal$Emissions)/(10^6)
totalEmissions2005FromCoal <- sum(Emission2005FromCoal$Emissions)/(10^6)
totalEmissions2008FromCoal <- sum(Emission2008FromCoal$Emissions)/(10^6)
EmissionsFromCoal <- c(totalEmissions1999FromCoal, totalEmissions2002FromCoal, totalEmissions2005FromCoal, totalEmissions2008FromCoal)
years <- c(1999, 2002, 2005, 2008)
totalEmissionPerYearFromCoal <- data.frame(EmissionsFromCoal,years)

png(file = "plot4.png", width = 480, height = 480, units="px",bg = "white")
plot(totalEmissionPerYearFromCoal$years, totalEmissionPerYearFromCoal$EmissionsFromCoal, type="l", main = "Total Emissions Per Year From Coal", xlab="Years", ylab="total PM2.5 emission per year From Coal (Million tons)", xaxt="n")
axis(side = 1, at = seq(1999, 2008, by = 3))
dev.off() 