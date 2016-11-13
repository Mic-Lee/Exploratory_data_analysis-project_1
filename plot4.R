library(data.table)
#load data
path <- getwd()
dataPath <- file.path(path,"Project-1","DataSource","household_power_consumption.txt")
hpcData <- fread(dataPath,sep = ";",header = T,na.strings = c("?"),stringsAsFactors = F)

#subset into date between 
hpcData.small<- subset(hpcData, hpcData$Date %in% c("1/2/2007","2/2/2007"))

#painting
globalActivePower<- as.numeric(hpcData.small$Global_active_power)
datetime <- strptime(paste(hpcData.small$Date, hpcData.small$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(hpcData.small$Sub_metering_1)
subMetering2 <- as.numeric(hpcData.small$Sub_metering_2)
subMetering3 <- as.numeric(hpcData.small$Sub_metering_3)
globalReactivePower <- as.numeric(hpcData.small$Global_reactive_power)
voltage <- as.numeric(hpcData.small$Voltage)
png("./Project-1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="datetime", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l",xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l",xlab="datetime", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()