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

#Plot 2 code

png(filename = "plot2.png",width = 480,height = 480)
plot(data$DateTime, as.numeric(data$Global_active_power),
	xlab="", ylab = "Global Active Power (kilowatts)", type = 'l')

dev.off()
