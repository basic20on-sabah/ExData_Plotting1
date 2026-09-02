if(!file.exists("household_power_consumption.zip")) {
  file_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(file_url, destfile = "household_power_consumption.zip")
}
unzip("household_power_consumption.zip", overwrite = TRUE)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
sub_data$DateTime <- as.POSIXct(paste(sub_data$Date, sub_data$Time), format="%d/%m/%Y %H:%M:%S" )
png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(sub_data$DateTime, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(sub_data$DateTime, sub_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(sub_data$DateTime, sub_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub_data$DateTime, sub_data$Sub_metering_2, col="red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")
plot(sub_data$DateTime, sub_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()