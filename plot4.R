## read data
dt <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

## subset the dataset to get only the data for first 2 days in February
bd <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
bd2 <- cbind(bd2, dt = strptime(paste(bd2$Date, bd2$Time), "%Y-%m-%d %H:%M:%S"))

## draw the graph to a png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(bd2$Global_active_power~bd2$dt, typ="l", ylab="Global Active Power(Kilowatts)", xlab="")

plot(bd2$Voltage~bd2$dt, typ="l", ylab="Voltage", xlab="datetime")

with(bd2, plot(dt, Sub_metering_1, typ="l", ylab="Energy sub metering", xlab=""))
with(bd2, points(dt, Sub_metering_2, typ="l", col="red", xlab=""))
with(bd2, points(dt, Sub_metering_3, typ="l", col="blue", xlab=""))
legend("topright", lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, bty="n")

plot(bd2$Global_reactive_power~bd2$dt, typ="l", ylab="Global_rective_power", xlab="datetime")

dev.off()
