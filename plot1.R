#
# R script file to create plot1.png for the week #1 project of the Exploratory Data
# Analysis class.
#

# Read the raw data from the data file provided for the assignment.
a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
    stringsAsFactors=FALSE)

# Subset the data to the specifc dates of interest then release the memory containing
# the unused data.
epc<-subset(a, Date=="1/2/2007" | Date=="2/2/2007")
rm(a)

# Create the PNG file containing the plot1 histogram.
png("plot1.png", width=480, height=480)

hist(epc$Global_active_power, breaks=seq(0, 8, 0.5), freq=TRUE, col="red", xaxp=c(0, 6, 3),
    main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

# Release the rest of the memory being used to hold the raw data.
rm(epc)
