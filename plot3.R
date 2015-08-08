download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";",header = T)


#filter only the dates we want
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,data$Date >= as.Date("2007-02-01"))
data <- subset(data,data$Date <= as.Date("2007-02-02"))

names(data)

#plot number 3

with(data, plot(as.numeric(as.character(Sub_metering_1)), type = "l" , xaxt = "n", 
                xlab = "", ylab = "Energy sub metering"))

lines(as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")
lines(as.numeric(as.character(data$Sub_metering_3)), type = "l", col = "blue")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright",lty= 1, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.copy(png, file ="Plot3.png")  
dev.off()

