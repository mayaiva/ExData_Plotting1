##Read data
data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Select 1st and 2nd of February 2007
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##Convert the date and time variables
datetime <- strptime(paste(data_subset$Date, the_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(data_subset$Global_active_power)
Global_reactive_power <- as.numeric(data_subset$Global_reactive_power)
 
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2)
subMetering3 <- as.numeric(data_subset$Sub_metering_3)
 
png("plot4.png", width=480, height=480)
 
par(mfrow = c(2, 2))

##Create 1st plot
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)
 
##Create 2nd plot
voltage <- as.numeric(data_subset$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Create 3rd plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Create 4th plot
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
