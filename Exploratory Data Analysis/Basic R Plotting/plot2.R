dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat_slice <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
dat_slice$Date <- as.Date(dat_slice$Date, format = "%d/%m/%Y ")
dat_slice$newdate <- with(dat_slice, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))

plot(dat_slice$newdate,dat_slice$Global_active_power, 
     type="n",
     ylab = "Global Active Power (kilowatts)",
     xlab=""
     )
lines(dat_slice$newdate,dat_slice$Global_active_power, type="l")

dev.copy(png, "plot2.png")
dev.off()
