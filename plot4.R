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

#Plot 4 code
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(data$DateTime, as.numeric(data$Global_active_power),
	xlab="", ylab = "Global Active Power (kilowatts)", type = 'l')
plot(data$DateTime, data$Voltage/1000, xlab="datetime", ylab = "Voltage", type = 'l')
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering",
	 type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", cex=0.7, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, as.numeric(data$Global_reactive_power),
	xlab="datetime", ylab = "Global_reactive_power", type = 'l')

dev.off()