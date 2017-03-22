dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat_slice <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
dat_slice$Date <- as.Date(dat_slice$Date, format = "%d/%m/%Y ")
dat_slice$newdate <- with(dat_slice, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))

plot(dat_slice$newdate,dat_slice$Sub_metering_1, 
     type="n",
     ylab = "Energy sub metering",
     xlab =""
     
)

lines(dat_slice$newdate, dat_slice$Sub_metering_1, type="l")

lines(dat_slice$newdate, dat_slice$Sub_metering_2, type="l", col="red")

lines(dat_slice$newdate,dat_slice$Sub_metering_3, type="l", col="blue")

legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()
