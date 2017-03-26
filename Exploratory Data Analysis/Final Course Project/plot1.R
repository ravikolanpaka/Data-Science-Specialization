NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png")
dat1 <- aggregate(NEI$Emissions, by=list(year = NEI$year), FUN=sum)
with(dat1, plot(year,x, type="b", lty = 2,xlab="Year", ylab="Total Emission"))


dev.off()
