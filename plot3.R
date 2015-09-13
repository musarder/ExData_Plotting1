png(filename="plot3.png", width=480, height=480, units="px")

data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
new_data <- subset(data, (as.Date(data$Date, format = '%d/%m/%Y') >= "2007-02-01") & (as.Date(data$Date, format = '%d/%m/%Y') <= "2007-02-02"))
plot(as.numeric(as.character(new_data$Sub_metering_1)), ylab = "Energy sub metering", xlab = "", type="l")
lines(as.numeric(as.character(new_data$Sub_metering_2)), col = "red", type = "l")
lines(new_data$Sub_metering_3, col = "blue", type = "l")
axis(1, c(0, length(new_data$Sub_metering_1)/2, length(new_data$Sub_metering_1)), c("Thu", "Fri", "Sat"))
axis(side = 2, at = seq(0, 30, by = 10))
legend("topright", lty=c(1, 1, 1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

dev.off()
