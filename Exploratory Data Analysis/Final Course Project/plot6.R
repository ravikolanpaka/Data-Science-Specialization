NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot6.png")
library(ggplot2)
dat <- merge ( NEI, SCC, by = "SCC")
dat1 <- dat[dat$fips == "24510"| dat$fips == "06037",]
dat2 <- dat1[grep(("Vehicle"), dat1$EI.Sector),]
dat3 <- aggregate(Emissions ~ year+fips, data=dat2, sum, na.rm=TRUE)
dat3$fips[dat3$fips == "24510"] <- "Baltimore"
dat3$fips[dat3$fips == "06037"] <- "Los Angeles"
qplot ( year, Emissions, data = dat3, geom = "line",color=fips, ylab = "Emissions from Vehicles")
dev.off()
