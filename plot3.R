#Read the data from file and use subset for 1st and 2nd Feb 2017
dataFile <- "./data/household_power_consumption.txt"
plot_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007") ,]

#grab date/time and other plot data
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset_data$Global_active_power)
sub_Metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_Metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_Metering3 <- as.numeric(subset_data$Sub_metering_3)

#draw plot
png("plot3.png", width=480, height=480)
plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()