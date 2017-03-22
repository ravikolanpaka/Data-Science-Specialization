dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat_slice <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
dat_slice$Date <- as.Date(dat_slice$Date, format = "%d/%m/%Y")

hist(dat_slice$Global_active_power,
     main="Global Active Power",
     col = "orangered",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.copy(png, "plot1.png")
dev.off()
