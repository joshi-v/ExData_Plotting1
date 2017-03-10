elec <- read.csv(unz("exdata data ousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors = FALSE)

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elec.sub <- subset(elec, ((elec$Date >= "2007-02-01") & (elec$Date <= "2007-02-02")))
rm(elec)

elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)

par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
hist(elec.sub$Global_active_power, col="red", 
main="Global Active Power", xlab="Global Active Power (kilowatts))")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
