## The file "household_power_consumption.txt" must be in the current working directory.
# Read file
hpc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                  strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the two dates
plotData <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time))

# Save Plot4 to a png file
png("plot4.png", width = 480, height = 480)

# create Plot4
par(mfcol=c(2,2))
plot(plotData$DateTime, plotData$Global_active_power, type= "l",lwd=1, 
     xlab="", ylab= "Global Active Power (kilowatts)")
plot(plotData$DateTime, plotData$Sub_metering_1, type="l", 
     xlab="", ylab= "Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_2, type="l", col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n", col=c("black", "red", "blue"))
plot(plotData$DateTime, plotData$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(plotData$DateTime, plotData$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
