data_0<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
data_0[data_0=="?"]<-NA
date_1<-strptime(paste(data_0[,1],data_0[,2]),format="%d/%m/%Y %H:%M:%S")
data_new<-cbind(Full_Date=date_1,data_0)
data_new<-data_new[66637:69516,]

data_new$Global_active_power<-as.numeric(as.character(data_new$Global_active_power))
hist(data_new$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab= "Frequency", main= "Global Active Power")