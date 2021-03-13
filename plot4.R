#the first bit downloads and unzips the data and reads and subsets data
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

#create new window of the right size
dev.new(width = 480, height = 480, unit = "px")
#set the frame for four plots
par(mfrow = c(2,2))
#plot 1
plot(power$dateandtime,power$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#plot 2
plot(power$dateandtime,power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#plot 3
plot(power$dateandtime,as.numeric(power$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(power$dateandtime,as.numeric(power$Sub_metering_2), type = "l", col ="red")
lines(power$dateandtime,as.numeric(power$Sub_metering_3), type = "l", col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n")
#plot 4
plot(power$dateandtime,power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png")
dev.off()