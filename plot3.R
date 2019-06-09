library("graphics")
library("grDevices")
library("data.table")

data=fread("data.txt",sep=";",header=T)

data1=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-01 CST"),]
data2=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-02 CST"),]

data3=rbind(data1,data2)

plot(data3$Sub_metering_1,type = "l",xaxt="n",xlab="",ylab="Energy sub metering")

with(data3,lines(data3$Sub_metering_3, col = "blue"))
with(data3,lines(data3$Sub_metering_2, col = "red"))
axis(1,labels=c("Thu","Fri","Sat"),at=c(1,1440,2880),las=1)

legend("topright", cex=0.8,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()