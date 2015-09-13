png(filename="plot4.png", width=480, height=480, units="px")

## Loading the data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
new_data <- subset(data, (as.Date(data$Date, format = '%d/%m/%Y') >= "2007-02-01") & (as.Date(data$Date, format = '%d/%m/%Y') <= "2007-02-02"))

par(mfrow=c(2,2))

## 1
plot(as.numeric(as.character(new_data$Global_active_power)), ylab = "Global Active Power", xlab = "", type = "l", xaxt="n")
axis(1, c(0, length(new_data$Global_active_power)/2, length(new_data$Global_active_power)), c("Thu", "Fri", "Sat"))

## 2
plot(as.numeric(as.character(new_data$Voltage)), ylab = "Voltage", xlab = "datetime", type = "l", xaxt="n")
axis(1, c(0, length(new_data$Global_active_power)/2, length(new_data$Global_active_power)), c("Thu", "Fri", "Sat"))

## 3
plot(as.numeric(as.character(new_data$Sub_metering_1)), ylab = "Energy sub metering", xlab = "", type = "l", xaxt="n")
lines(as.numeric(as.character(new_data$Sub_metering_2)), col = "red")
lines(new_data$Sub_metering_3, col = "blue")
axis(1, c(0, length(new_data$Sub_metering_1)/2, length(new_data$Sub_metering_1)), c("Thu", "Fri", "Sat"))
axis(side = 2, at = seq(0, 30, by = 10))
legend("topright", lty=c(1, 1, 1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), bty = "n")

## 4
plot(as.numeric(as.character(new_data$Global_reactive_power)), ylab = "Global_reactive_power", xlab = "datetime", type = "l", xaxt="n", lwd = .1)
axis(1, c(0, length(new_data$Global_active_power)/2, length(new_data$Global_active_power)), c("Thu", "Fri", "Sat"))

dev.off()