plot2 <- function(){
  power
  FullTimeDate <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  power <- cbind(power, FullTimeDate)
  
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  power$Time <- format(power$Time, format="%H:%M:%S")
  power$Global_active_power <- as.numeric(power$Global_active_power)
  power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
  power$Voltage <- as.numeric(power$Voltage)
  power$Global_intensity <- as.numeric(power$Global_intensity)
  power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
  power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
  power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
  
  png("plot2.png", width=480, height=480)
  with(power, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
}
