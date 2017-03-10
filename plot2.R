elec <- read.csv(unz("exdata data ousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors = FALSE)

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elec.sub <- subset(elec, ((elec$Date >= "2007-02-01") & (elec$Date <= "2007-02-02")))
rm(elec)

elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)

datetime <- paste(as.Date(elec.sub$Date), elec.sub$Time)
elec.sub$Datetime <- as.POSIXct(datetime)

plot(elec.sub$Global_active_power~elec.sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
