cheader <- c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dt <- read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrows=2880, sep=";", col.names = cheader, stringsAsFactors = FALSE)

# Get dateTime from Date and Time fields
dt$dateTimes <- paste(dt$Date, dt$Time, sep = " ")
dt$dateTimes <- strptime(dt$dateTime, "%d/%m/%Y %H:%M:%S")

# Set layout and margins
par(mfrow = c(2,2), mar= c(4, 4, 1, 1))

# Plot 1
plot( dt$dateTimes, dt$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# Plot 2
plot( dt$dateTimes, dt$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Plot 3
plot(dt$dateTimes, dt$Sub_metering_1, type="l", col="black", ylab="Energy Sub Metering", xlab="")
points(dt$dateTimes, dt$Sub_metering_2, type="l", col="red")
points(dt$dateTimes, dt$Sub_metering_3, type="l", col="blue")
legend("top", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n", cex=0.7)


# Plot 4
plot(dt$dateTimes, dt$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
