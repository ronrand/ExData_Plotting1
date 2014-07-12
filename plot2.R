## The file "household_power_consumption.txt" must be in the current working directory.
# Read file
hpc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                  strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the two dates
plotData <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time))

# create Plot2
plot(plotData$DateTime, plotData$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")

# Save Plot2 to a png file
dev.copy(png,"plot2.png",units="px",height=480,width=480)

dev.off()
