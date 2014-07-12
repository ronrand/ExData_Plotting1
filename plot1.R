## The file "household_power_consumption.txt" must be in the current working directory.
# Read file
hpc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                  strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the two dates
plotData <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 

# create Plot1
hist(plotData$Global_active_power, col= "red",
     xlab= "Global Active Power (kilowatts)",
     ylab= "Frequency", main= "Global Active Power")

# Save Plot1 to a png file
dev.copy(png,"plot1.png",units="px",height=480,width=480)

dev.off()
