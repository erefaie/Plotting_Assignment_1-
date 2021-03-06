## read data
dt <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

## subset the dataset to get only the data for first 2 days in February
bd <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")

## draw the graph to a png file
png(file = "plot1.png", width = 480, height = 480)
with(bd, hist(bd$Global_active_power, main="Global Active Power", col="red", ylim=c(0, 1200), xlab="Global Active Power(Kilowatts)", ylab="Frequency"))
dev.off()
