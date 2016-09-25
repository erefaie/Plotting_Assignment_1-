## read data
dt <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

## subset the dataset to get only the data for first 2 days in February
bd <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
bd2 <- cbind(bd2, dt = strptime(paste(bd2$Date, bd2$Time), "%Y-%m-%d %H:%M:%S"))

## draw the graph to a png file
png(file = "plot2.png", width = 480, height = 480)
plot(bd2$Global_active_power~bd2$dt, typ="l", ylab="Global Active Power(Kilowatts)", xlab="")
dev.off()
