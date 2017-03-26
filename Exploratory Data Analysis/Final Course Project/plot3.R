NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot3.png")
library (ggplot2)
NEI2 <- NEI[NEI$fips == "24510",]
dat2 <- aggregate(Emissions ~ year+type, data=NEI2, sum, na.rm=TRUE)
qplot ( year, Emissions, data = dat2, color = type, geom = "line")

dev.off()
