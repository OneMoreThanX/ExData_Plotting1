plot4<- function(){
	power <- read.table("power.txt",sep = ";",header = T, stringsAsFactors = F)
	two_day <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")
	dt <- paste(two_day$Date,two_day$Time,sep = ",")
	time <- strptime(dt,format = "%d/%m/%Y,%H:%M:%S")
	
	ap <- as.numeric(two_day$Global_active_power)
	
	vol <- as.numeric(two_day$Voltage)
	 
	sub1 <- as.numeric(two_day$Sub_metering_1)
	sub2 <- as.numeric(two_day$Sub_metering_2)
	sub3 <- as.numeric(two_day$Sub_metering_3)

	rp <- as.numeric(two_day$Global_reactive_power)

	png(filename = "plot4.png",width = 480, height = 480, units = "px")
	par(mfrow = c(2,2),cex=.50)
	plot(time,ap,type="l",xlab="",ylab="Global Active Power")
	plot(time,vol,type="l",xlab="datetime",ylab="Voltage")
	plot(time,sub1,type="l",xlab="",ylab="Energy sub metering")
	lines(time,sub2,col="red")
	lines(time,sub3,col="blue")
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),text.font=1)
	plot(time,rp,type="l",xlab= "datetime",ylab="Global_reactive_power")
	dev.off()
}