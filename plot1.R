library(data.table)
#load data
path <- getwd()
dataPath <- file.path(path,"Project-1","DataSource","household_power_consumption.txt")
hpcData <- fread(dataPath,sep = ";",header = T,na.strings = c("?"),stringsAsFactors = F)

#subset into date between 
hpcdata.small<- subset(hpcData, hpcData$Date %in% c("1/2/2007","2/2/2007"))

#painting
globalActivePower<- as.numeric(hpcdata.small$Global_active_power)
png("./Project-1/plot1.png", width = 480, height = 480)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()
