#Read the data from file and use subset for 1st and 2nd Feb 2017
dataFile <- "./data/household_power_consumption.txt"
plot_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007") ,]

#grab data and plot graph
globalActivePower <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()