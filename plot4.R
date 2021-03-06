elec <- read.csv(unz("exdata data ousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors = FALSE)

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elec.sub <- subset(elec, ((elec$Date >= "2007-02-01") & (elec$Date <= "2007-02-02")))
rm(elec)

elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(elec.sub, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
