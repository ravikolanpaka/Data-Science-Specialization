NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot2.png")
NEI2 <- NEI[NEI$fips == "24510",]
dat2 <- aggregate(NEI2$Emissions, by=list(year = NEI2$year), FUN=sum)
with(dat2, plot(year,x, type="b", lty = 2,xlab="Year", ylab="Total Emission in Baltimore City, Maryland"))

dev.off()
