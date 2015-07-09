#read data
completedata <- read.csv("household_power_consumption.txt",sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),  na.strings = "?")
data <- completedata[completedata$Date == "1/2/2007" | completedata$Date == "2/2/2007",]

#x axis
x <- c(1:nrow(data))

#x labels
dates <- c("1/2/2007","2/2/2007","3/2/2007")
date <- strptime(dates, "%d/%m/%Y")
label <- c(weekdays(date, abbreviate = T))

#draw plot
plot(x, data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(x, data$Sub_metering_2, type = "l", col = "red")
lines(x, data$Sub_metering_3, type = "l", col = "blue")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)

#export to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
