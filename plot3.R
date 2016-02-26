#
# R script file to create plot3.png for the week #1 project of the Exploratory Data
# Analysis class.
#

library(dplyr)
library(lubridate)

# Read the raw data from the data file provided for the assignment.
a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
    stringsAsFactors=FALSE)

# Subset the data to the specifc dates of interest.
epc<-subset(a, Date=="1/2/2007" | Date=="2/2/2007")
rm(a)       # Release the memory containing the unused data.

# Convert the Date and Time columns to a single new combined date/time column.
epc<-mutate(epc, fDT=dmy_hms(paste(Date, Time)))

# Create the PNG file containing the plot3 line chart.
png("plot3.png", width=480, height=480)

plot(epc$fDT, epc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(epc$fDT, epc$Sub_metering_1, type="l", col="black")   # 1st data set
lines(epc$fDT, epc$Sub_metering_2, type="l", col="red")     # 2nd data set
lines(epc$fDT, epc$Sub_metering_3, type="l", col="blue")    # 3rd data set

legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col=c("black", "red", "blue"), lty=1)

dev.off()

# Release the rest of the memory being used to hold the raw data.
rm(epc)
