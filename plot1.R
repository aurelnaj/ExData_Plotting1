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

#Plot 1 code
png(filename = "plot1.png",width = 480,height = 480)
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)",
	 main = "", col = "red")

dev.off()