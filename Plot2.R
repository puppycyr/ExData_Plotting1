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
plot(x, data$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1,at = c(0, 0.5*length(x),length(x)),labels = label)

#export to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
