##Reading full dataset into R
fullpower <- read.table(file = "./household_power_consumption.txt", sep = ";", 
                        header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
fullpower$datetime <- paste(fullpower$Date, fullpower$Time)
fullpower$datetime <- strptime(fullpower$datetime, format = "%d/%m/%Y %H:%M:%S")

subsetpower <- subset(fullpower, datetime >=as.POSIXlt("2007-02-01 00:00:00") & 
                        datetime < as.POSIXlt("2007-02-03 00:00:00"))

##Creating Plot 2 and saving in file
png(file= "plot2.png")
plot(subsetpower$datetime, subsetpower$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()