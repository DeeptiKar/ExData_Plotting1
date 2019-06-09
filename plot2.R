library("graphics")
library("grDevices")
library("data.table")

data=fread("data.txt",sep=";",header=T)

data1=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-01 CST"),]
data2=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-02 CST"),]

data3=rbind(data1,data2)

plot(as.numeric(as.character(data3$Global_active_power)),ylab="Global Active Power (kilowatts)",type="l",xlab="",xaxt="n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1,1440,2880),las=1)
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()