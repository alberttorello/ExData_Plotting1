household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
cleandataset <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02",]

cleandataset$Datetime <- strptime(paste(cleandataset$Date, cleandataset$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(cleandataset$Datetime, cleandataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(cleandataset$Datetime, cleandataset$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(cleandataset$Datetime, cleandataset$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.off()