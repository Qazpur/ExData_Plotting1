# Read first 70K rows of data, then filter on date string
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=70000)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Create plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Export plot to PNG
dev.copy(png, file="plot1.png")
dev.off()