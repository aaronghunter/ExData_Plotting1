datafile <- "./Data/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

hist(as.numeric(as.character(subset$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file= "plot1.png", width = 480, height = 480)
dev.off()