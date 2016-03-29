cheader <- c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dt <- read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrows=2880, sep=";", col.names = cheader, stringsAsFactors = FALSE)

# Get dateTime from Date and Time fields
dt$dateTimes <- paste(dt$Date, dt$Time, sep = " ")
dt$dateTimes <- strptime(dt$dateTime, "%d/%m/%Y %H:%M:%S")

# Set size to help calculate size of legend
par(pin=c(4,4))

# Plot 3
plot(dt$dateTimes, dt$Sub_metering_1, type="l", col="black", ylab="Energy Sub Metering", xlab="")
points(dt$dateTimes, dt$Sub_metering_2, type="l", col="red")
points(dt$dateTimes, dt$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.7)


