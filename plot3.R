#THIS ASSUMES THE DATA IS ON A LOCAL DIRECTORY.

dataread3<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec=".")

subdata3 <- dataread3[dataread3$Date %in% c("1/2/2007","2/2/2007"), ] 

data3<- strptime(paste(subdata3$Date, subdata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_Metering1 <- as.numeric(subdata3 [ , 7])
Sub_Metering2 <- as.numeric(subdata3 [ , 8])
Sub_Metering3 <- as.numeric(subdata3 [ , 9])

png("plot3.png", width=480, height=480)  
plot(data3, Sub_Metering1, type="l", ylab="Energy sub metering", xlab="")  
    lines(data3, Sub_Metering2, type="l", col="red")  
    lines(data3, Sub_Metering3, type="l", col="blue")  
    
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))  

dev.off() 
