# File names
# Data file should be in the same directory of all this R scripts
dataFile <- "./household_power_consumption.txt"
plotFile <- "plot2.png"

# Reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# Plot generation
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(plotFile, width=480, height=480)
plot(datetime,globalActivePower, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()