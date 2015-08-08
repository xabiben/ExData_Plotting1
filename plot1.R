download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";",header = T)


#filter only the dates we want
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,data$Date >= as.Date("2007-02-01"))
data <- subset(data,data$Date <= as.Date("2007-02-02"))

names(data)

#plot number 1
data$Global_active_power2 <- as.numeric((as.character(data$Global_active_power)))
with(data, hist(as.numeric(Global_active_power2), col = "red", main=("Global active power"), 
                xlab = "Global active power (kilowatts)"))
dev.copy(png, file ="Plot1.png")  
dev.off()
