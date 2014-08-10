data <- read.table(pipe('grep \'^[12]/2/2007\' ./household_power_consumption.txt'), sep=";", header=F)
get_names <- read.table(pipe('head -1 ./household_power_consumption.txt'), sep=";", header=T)
names(data) <- names(get_names)

png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
