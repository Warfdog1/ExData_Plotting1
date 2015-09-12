#THIS ASSUMES THE DATA IS ON A LOCAL DIRECTORY.

setwd("C:/Users/FWarf/Exploratory_Data_Coursera/Project1")


dataread1<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec=".")

subdata1 <- dataread1[dataread1$Date %in% c("1/2/2007","2/2/2007"), ] 

Global_Active_Power <- as.numeric(subdata1[ ,"Global_active_power"])

png("plot1.png", width=480, height=480) 
hist(Global_Active_Power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)") 

dev.off()
