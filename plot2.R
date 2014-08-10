data <- read.table(pipe('grep \'^[12]/2/2007\' ./household_power_consumption.txt'), sep=";", header=F)
get_names <- read.table(pipe('head -1 ./household_power_consumption.txt'), sep=";", header=T)
names(data) <- names(get_names)

time = strptime(x = paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480)
with(data, plot(x = time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
