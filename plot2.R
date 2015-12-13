household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
cleandataset <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02",]

cleandataset$Datetime <- strptime(paste(cleandataset$Date, cleandataset$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(cleandataset$Datetime, cleandataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()