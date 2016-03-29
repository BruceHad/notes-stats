cheader <- c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dt <- read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrows=2880, sep=";", col.names = cheader, stringsAsFactors = FALSE)

# Get dateTime from Date and Time fields
dt$dateTimes <- paste(dt$Date, dt$Time, sep = " ")
dt$dateTimes <- strptime(dt$dateTime, "%d/%m/%Y %H:%M:%S")

#Plot 2
plot( dt$dateTimes, dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
