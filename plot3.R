##Reading full dataset into R
fullpower <- read.table(file = "./household_power_consumption.txt", sep = ";", 
                        header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
fullpower$datetime <- paste(fullpower$Date, fullpower$Time)
fullpower$datetime <- strptime(fullpower$datetime, format = "%d/%m/%Y %H:%M:%S")

subsetpower <- subset(fullpower, datetime >=as.POSIXlt("2007-02-01 00:00:00") & 
                        datetime < as.POSIXlt("2007-02-03 00:00:00"))

##Creating Plot 3 and saving in file
png(file= "plot3.png")
with(subsetpower, plot(subsetpower$datetime, subsetpower$Sub_metering_1, type ="l", xlab= "", ylab="Energy sub metering"))
    lines(subsetpower$datetime, subsetpower$Sub_metering_2, col = "red")
    lines(subsetpower$datetime, subsetpower$Sub_metering_3, col = "blue")
    legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()