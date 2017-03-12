##read data
data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Select 1st and 2nd of February 2007
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert and combine the date and time variables 
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Create plot saved as jpeg
Global_active_power <- as.numeric(data_subset$Global_active_power)
png("plot2.png", width= 480, height= 480)
plot(datetime, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
