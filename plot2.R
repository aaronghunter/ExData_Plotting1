datafile <- "./Data/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(subset$Date, subset$Time, sept = " "), "%d/%m/%Y %H:%M:%S")
plot(dt, as.numeric(as.character(subset$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") #Plot Type: Line
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()