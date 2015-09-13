data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
new_data <- subset(data, (as.Date(data$Date, format = '%d/%m/%Y') >= "2007-02-01") & (as.Date(data$Date, format = '%d/%m/%Y') <= "2007-02-02"))
plot(as.numeric(as.character(new_data$Global_active_power)), ylab = "Global Active Power (kilowatts)", xlab = "", type="l", xaxt="n")
axis(1, c(0, length(new_data$Global_active_power)/2, length(new_data$Global_active_power)), c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png")
dev.off()