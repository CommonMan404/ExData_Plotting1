#the first bit downloads and unzips the data and reads and subsets data
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip")
#unzip("power.zip")
#power <- read.csv("household_power_consumption.txt", sep = ";")

#This subsets the data by treating the date as a string, easier as it is only two dates
#power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

#Set missing values
power[power == "?"] <- NA

#create the plot. It first creates a graphic device of the right size, then the plot, and then saves it.
dev.new(width = 480, height = 480, unit = "px")
hist(as.numeric(power$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()


