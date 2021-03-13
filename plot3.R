#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
#unzip("power.zip")
#power <- read.csv("household_power_consumption.txt", sep = ";")

#This subsets the data by treating the date as a string, easier as it is only two dates
#power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

#Set missing values
power[power == "?"] <- NA

#creates a date and time variable and puts it in the time format
power$dateandtime <- paste(power$Date, power$Time)
power$dateandtime <- strptime(power$dateandtime, format = "%d/%m/%Y %H:%M:%S")

#create the plot. It first creates a graphic device of the right size, then the plot, and then saves it.
dev.new(width = 480, height = 480, unit = "px")
plot(power$dateandtime,as.numeric(power$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(power$dateandtime,as.numeric(power$Sub_metering_2), type = "l", col ="red")
lines(power$dateandtime,as.numeric(power$Sub_metering_3), type = "l", col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), pch ="----")
dev.copy(png, file = "plot3.png")
dev.off()