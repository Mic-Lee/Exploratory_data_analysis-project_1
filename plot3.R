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

png("./Project-1/plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()