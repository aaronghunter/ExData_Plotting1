datafile <- "./Data/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(subset$Date, subset$Time, sept = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480) #dev.copy() distorts the legend
plot(dt, as.numeric(as.character(subset$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy Submetering")
lines(dt, as.numeric(as.character(subset$Sub_metering_2)), col = "red")
lines(dt, as.numeric(as.character(subset$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.off()