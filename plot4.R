datafile <- "./Data/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(subset$Date, subset$Time, sept = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(as.character(subset$Global_active_power))
gra <- as.numeric(as.character(subset$Global_reactive_power))
vlt <- as.numeric(as.character(subset$Voltage))
sm1 <- as.numeric(as.character(subset$Sub_metering_1))
sm2 <- as.numeric(as.character(subset$Sub_metering_2))
sm3 <- as.numeric(as.character(subset$Sub_metering_3))

png("plot4.png", width = 480, height = 480) #dev.copy() distorts the legend
par(mfrow = c(2, 2))

with(subset, {
  plot(dt, gap, type = "l", xlab = "", ylab = "Global Active Power")
  plot(dt, vlt, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(dt, sm1, type = "l", xlab = "", ylab = "Energy Submetering")
  lines(dt, sm2, col = "red")
  lines(dt, sm3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))
  plot(dt, gra, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()