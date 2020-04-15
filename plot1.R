setwd("exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", sep = ';', header=T)
data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
windows()
data <- as.numeric(data[,"Global_active_power"])
setwd('..')
png("plot1.png", width = 480, height = 480)
hist(data,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")