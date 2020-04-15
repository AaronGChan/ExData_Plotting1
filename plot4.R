setwd("exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", sep = ';', header=T, na.strings = "?")
data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
setwd('..')
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data,{
  plot(datetime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(datetime, Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
  plot(data$datetime, data$Sub_metering_1, type = 'l',col = 'black',xlab = "", ylab = "Energy Sub Metering")
  lines(data$datetime, data$Sub_metering_2, col = 'red')
  lines(data$datetime, data$Sub_metering_3, col = 'blue')
  legend(x="topright", y = 350, legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col =c("black", "red", "blue") , lty=1:2, cex=0.8)
  plot(datetime, Global_reactive_power, type = 'l', xlab = "Datetime", ylab = "Global_reactive_power")
}
)

dev.off()