household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

cleandataset <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02",]

cleandataset$datetime <- paste(cleandataset$Date, cleandataset$Time)

household_power_consumption$Time <- strptime(household_power_consumption$Time, format = "%T")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(cleandataset$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.off()