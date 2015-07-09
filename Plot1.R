#read data
completedata <- read.csv("household_power_consumption.txt",sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),  na.strings = "?")
data <- completedata[completedata$Date == "1/2/2007" | completedata$Date == "2/2/2007",]

#draw plot
hist(data$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#export to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
