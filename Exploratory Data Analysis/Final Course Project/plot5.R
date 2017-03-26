NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot5.png")
library(ggplot2)
dat <- merge ( NEI, SCC, by = "SCC")
dat1 <- dat[dat$fips == "24510",]
dat2 <- dat1[grep(("Vehicle"), dat1$EI.Sector),]
dat3 <- aggregate(Emissions ~ year, data=dat2, sum, na.rm=TRUE)
qplot ( year, Emissions, data = dat3, geom = "line", ylab = "Emissions from Vehicles in Baltimore")
dev.off()
