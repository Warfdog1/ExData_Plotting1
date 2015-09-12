#THIS ASSUMES THE DATA IS ON A LOCAL DIRECTORY.

dataread4<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec=".")

subdata4 <- dataread4[dataread4$Date %in% c("1/2/2007","2/2/2007"), ] 

data4<- strptime(paste(subdata4$Date, subdata4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_Metering1 <- as.numeric(subdata4 [ , 7])
Sub_Metering2 <- as.numeric(subdata4 [ , 8])
Sub_Metering3 <- as.numeric(subdata4 [ , 9])
Voltage <- as.numeric(subdata4 [ , 5])
Global_Reactive_Power <- as.numeric(subdata4 [ , 4])
Global_Active_Power <- as.numeric(subdata4[ ,"Global_active_power"])

png("plot4.png", width=480, height=480)  

par(mfrow = c(2, 2))   

plot(data4, Global_Active_Power, type="l", xlab="", ylab="Global Active Power") 

plot(data4, Voltage, type="l", xlab="datetime", ylab="Voltage") 

plot(data4, Sub_Metering1, type="l", ylab="Energy sub metering", xlab="")  
lines(data4, Sub_Metering2, type="l", col="red")  
lines(data4, Sub_Metering3, type="l", col="blue")  
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")  

plot(data4, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off() 
