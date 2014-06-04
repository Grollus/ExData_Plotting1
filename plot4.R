##Reading full dataset into R
fullpower <- read.table(file = "./household_power_consumption.txt", sep = ";", 
                        header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
fullpower$datetime <- paste(fullpower$Date, fullpower$Time)
fullpower$datetime <- strptime(fullpower$datetime, format = "%d/%m/%Y %H:%M:%S")

subsetpower <- subset(fullpower, datetime >=as.POSIXlt("2007-02-01 00:00:00") & 
                        datetime < as.POSIXlt("2007-02-03 00:00:00"))

##Creating plot 4 and saving in file
png(file="plot4.png")
par(mfrow = c(2, 2))
with(subsetpower, {
      plot(subsetpower$datetime, subsetpower$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
      plot(subsetpower$datetime, subsetpower$Voltage, type = "l", xlab= "datetime", ylab = "Voltage")
      with(subsetpower, plot(subsetpower$datetime, subsetpower$Sub_metering_1, type ="l", xlab= "", ylab="Energy sub metering"))
          lines(subsetpower$datetime, subsetpower$Sub_metering_2, col = "red")
          lines(subsetpower$datetime, subsetpower$Sub_metering_3, col = "blue")
          legend("topright", bty = "n", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(subsetpower$datetime, subsetpower$Global_reactive_power, type = "l", xlab= "datetime", ylab= "Global_reactive_power")
})
dev.off()