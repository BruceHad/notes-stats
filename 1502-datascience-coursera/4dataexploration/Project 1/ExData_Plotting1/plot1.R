cheader <- c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dt <- read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrows=2880, sep=";", col.names = cheader, stringsAsFactors = FALSE)


#Plot 1
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
