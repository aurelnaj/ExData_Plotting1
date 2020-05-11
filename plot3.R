library(readr)
power <- read_csv2("household_power_consumption.txt")

data <- as.data.frame(power, na.strings="?")
data <- data[complete.cases(data),]

library(lubridate)
data$Date <- dmy(data$Date)

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

library(stringr)
DateTime<- paste(data$Date,data$Time)
data$DateTime<-as.POSIXct(DateTime)

#Plot 3 code
png(filename = "plot3.png",width = 480,height = 480)
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering",
	 type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()