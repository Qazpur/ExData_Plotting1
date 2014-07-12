# Read first 70K rows of data, then filter on date string
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=70000)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Turn date and time strings into date type
x <- paste(data$Date, data$Time)
data$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# For foreign locales, we need to save and set locale for English weekdays
loc <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale(category = "LC_TIME", locale = "C")

# Create plot
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Export plot to PNG
dev.copy(png, file="plot2.png")
dev.off()

# Reset our locale
Sys.setlocale(category = "LC_TIME", locale = loc)