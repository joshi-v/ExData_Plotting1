elec <- read.csv(unz("exdata data ousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors = FALSE)

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elec.sub <- subset(elec, ((elec$Date >= "2007-02-01") & (elec$Date <= "2007-02-02")))
rm(elec)

elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)
datetime <- paste(as.Date(elec.sub$Date), elec.sub$Time)
elec.sub$Datetime <- as.POSIXct(datetime)

with(elec.sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd = 2.5, col=c("black", "red", "blue"), cex = 0.75)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
