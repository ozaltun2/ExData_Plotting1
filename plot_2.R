data_0<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
data_0[data_0=="?"]<-NA
date_1<-strptime(paste(data_0[,1],data_0[,2]),format="%d/%m/%Y %H:%M:%S")
data_new<-cbind(Full_Date=date_1,data_0)
data_new<-data_new[66637:69516,]

data_new$Global_active_power<-as.numeric(as.character(data_new$Global_active_power))
par(pch=46)
with(data_new,plot(Full_Date,Global_active_power),pch=NULL,ylab="Global Activity Power(kilowatts)",xlab="  ")
lines(data_new$Full_Date,y=data_new$Global_active_power)