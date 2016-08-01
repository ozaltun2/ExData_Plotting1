data_0<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
data_0[data_0=="?"]<-NA
date_1<-strptime(paste(data_0[,1],data_0[,2]),format="%d/%m/%Y %H:%M:%S")
data_new<-cbind(Full_Date=date_1,data_0)
data_new<-data_new[66637:69516,]

data_new$Global_active_power<-as.numeric(as.character(data_new$Global_active_power))
data_new$Global_reactive_power<-as.numeric(as.character(data_new$Global_reactive_power))
data_new$Sub_metering_1<-as.numeric(as.character(data_new$Sub_metering_1))
data_new$Sub_metering_2<-as.numeric(as.character(data_new$Sub_metering_2))
data_new$Sub_metering_3<-as.numeric(as.character(data_new$Sub_metering_3))
data_new$Voltage<-as.numeric(as.character(data_new$Voltage))

par(mfrow = c(2, 2))

#Plot 1
plot(data_new$Full_Date, data_new$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power")

#Plot 2

plot(data_new$Full_Date,data_new$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")

#Plot 3

plot(data_new$Full_Date, data_new$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(data_new$Full_Date, data_new$Sub_metering_2, type = "l", col = "red")
lines(data_new$Full_Date, data_new$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

#Plot 4

plot(data_new$Full_Date, data_new$Global_reactive_power, type = "l",xlab = "",ylab = "Global Active Power")

