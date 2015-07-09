#read data
completedata <- read.csv("household_power_consumption.txt",sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),  na.strings = "?")
data <- completedata[completedata$Date == "1/2/2007" | completedata$Date == "2/2/2007",]

#arrange plots
par(mfrow = c(2,2))

#x axis
x <- c(1:nrow(data))

#x labels
dates <- c("1/2/2007","2/2/2007","3/2/2007")
date <- strptime(dates, "%d/%m/%Y")
label <- c(weekdays(date, abbreviate = T))


######plot1#####

plot(x, data$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)

######plot2#####

plot(x, data$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)

######plot3#####

plot(x, data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(x, data$Sub_metering_2, type = "l", col = "red")
lines(x, data$Sub_metering_3, type = "l", col = "blue")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1, cex = 0.7, bty = "n")

######plot4#####

plot(x, data$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)



#export to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
