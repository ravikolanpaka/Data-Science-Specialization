dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat_slice <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
dat_slice$Date <- as.Date(dat_slice$Date, format = "%d/%m/%Y ")
dat_slice$newdate <- with(dat_slice, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))
png("plot4.png")
par(mfrow=c(2,2))

plot(dat_slice$newdate,dat_slice$Global_active_power, 
     type="n",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
)
lines(dat_slice$newdate,dat_slice$Global_active_power, type="l")

plot(dat_slice$newdate,dat_slice$Voltage, 
     type="n",
     ylab = "Voltage",
     xlab = "datetime"
)
lines(dat_slice$newdate,dat_slice$Voltage, type="l")

plot(dat_slice$newdate,dat_slice$Sub_metering_1, 
     type="n",
     ylab = "Energy sub metering",
     xlab =""
     
)
lines(dat_slice$newdate, dat_slice$Sub_metering_1, type="l")
lines(dat_slice$newdate, dat_slice$Sub_metering_2, type="l", col="red")
lines(dat_slice$newdate,dat_slice$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dat_slice$newdate,dat_slice$Global_reactive_power, 
     type="n",
     ylab = "Global_reactive_power",
     xlab="datetime"
)
lines(dat_slice$newdate,dat_slice$Global_reactive_power, type="l")

dev.off()
