download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";",header = T)


#filter only the dates we want
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,data$Date >= as.Date("2007-02-01"))
data <- subset(data,data$Date <= as.Date("2007-02-02"))

names(data)


#plot number 2

with(data, plot(Global_active_power2, type = "l", xaxt = "n", xlab = "", 
                ylab = "Global active power (kilowatts)"))
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
dev.copy(png, file ="Plot2.png")  
dev.off()

