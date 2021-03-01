read.csv('power.csv')
power<-read.csv('power.csv')
hist(power$Global_active_power,power$Global_active_power, breaks = 16, xlab = 'Global Active Power (killowatts)', ylab= 'Frequency',col = 'red', main = 'Global Active Power')