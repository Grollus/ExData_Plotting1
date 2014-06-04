##Reading full dataset into R
fullpower <- read.table(file = "./household_power_consumption.txt", sep = ";", 
                        header = TRUE)
fullpower$Date <- as.Date(as.character(fullpower$Date), "%d/%m/%Y")
subsetpower <- subset(fullpower, Date==as.Date("2007-02-01") | 
                                                  Date==as.Date("2007-02-02"))

##Creating Plot 1 and saving in file
png(file="plot1.png")
hist(as.numeric(as.character(subsetpower$Global_active_power)), col ="red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main= "Global Active Power")
dev.off()
