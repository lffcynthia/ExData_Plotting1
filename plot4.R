data <- read.table(pipe('grep \'^[12]/2/2007\' ./household_power_consumption.txt'), sep=";", header=F)
get_names <- read.table(pipe('head -1 ./household_power_consumption.txt'), sep=";", header=T)
names(data) <- names(get_names)

time = strptime(x = paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png(file = "plot4.png", width=480,height=480)
par(mfrow=c(2,2))
with(data, plot(x = time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data, plot(x = time, y = Voltage, xlab="datetime",type="l"))

with(data, plot(x = time, Sub_metering_1, col = "black", type = "l", ylab="Energy sub metering"))
with(data, lines(time, Sub_metering_2, col = "red", type="l"))
with(data, lines(time, Sub_metering_3, col = "blue", type="l"))
legend("topright", legend=paste("Sub_metering",1:3,sep="_"),lty=1,col=c("black","red","blue"), bty="n")

with(data, plot(time, Global_reactive_power,type = "l",xlab="datetime"))
dev.off()
