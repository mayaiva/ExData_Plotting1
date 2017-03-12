 ##read data
data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Select 1st and 2nd of February 2007
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
 
#Create plot saved as jpeg
Global_active_power <- as.numeric(data_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
