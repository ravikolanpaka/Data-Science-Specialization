NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot4.png")
library(ggplot2)
dat <- merge ( NEI, SCC, by = "SCC")
dat1 <- dat[dat$EI.Sector =="Fuel Comb - Electric Generation - Coal",]
dat2 <- aggregate(Emissions ~ year, data=dat1, sum, na.rm=TRUE)
qplot ( year, Emissions, data = dat2, geom = "line", ylab = "Emissions from Coal")
dev.off()
