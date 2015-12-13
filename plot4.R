household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
cleandataset <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02",]

cleandataset$Datetime <- strptime(paste(cleandataset$Date, cleandataset$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

plot(cleandataset$Datetime, cleandataset$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

plot(cleandataset$Datetime, cleandataset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(cleandataset$Datetime, cleandataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(cleandataset$Datetime, cleandataset$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(cleandataset$Datetime, cleandataset$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n", )

plot(cleandataset$Datetime, cleandataset$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()