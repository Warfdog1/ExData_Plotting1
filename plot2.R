#THIS ASSUMES THE DATA IS ON A LOCAL DIRECTORY.

dataread2<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec=".")

subdata2 <- dataread2[dataread2$Date %in% c("1/2/2007","2/2/2007"), ] 

data2<- strptime(paste(subdata2$Date, subdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot2.png", width=480, height=480) 
Global_Active_Power <- as.numeric(subdata2$Global_active_power) 
plot(data2, Global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")  

dev.off() 
