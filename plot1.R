if(!file.exists("household_power_consumption.zip")) {
  file_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(file_url, destfile = "household_power_consumption.zip")
}
unzip("household_power_consumption.zip", overwrite = TRUE)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
global_active_power <- as.numeric(sub_data$Global_active_power)
png(filename = "plot1.png", width=480, height=480)
hist(global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
png(filename = "plot2.png", width=480, height=480)
plot(sub_data$DateTime, sub_data$Global_active_power, type="l", xlab="", ", ylab="Global Active Power (kilowatts)")
dev.off()
