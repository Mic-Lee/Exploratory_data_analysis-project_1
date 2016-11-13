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
png("./Project-1/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
