plot4 <- function() {
  power
  
  FullTimeDate <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  power <- cbind(power, FullTimeDate)
  
  ## change class of all columns to correct class
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  power$Time <- format(power$Time, format="%H:%M:%S")
  power$Global_active_power <- as.numeric(power$Global_active_power)
  power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
  power$Voltage <- as.numeric(power$Voltage)
  power$Global_intensity <- as.numeric(power$Global_intensity)
  power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
  power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
  power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
}

  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(power, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(power, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(power, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(FullTimeDate, power$Sub_metering_2,type="l", col= "red")
  lines(FullTimeDate, power$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  with(power, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
