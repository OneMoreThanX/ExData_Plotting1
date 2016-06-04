plot2 <- function(){
	power <- read.table("power.txt",sep = ";",header = T, stringsAsFactors = F)
	two_day <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")
	p <- as.numeric(two_day$Global_active_power)
	dt <- paste(two_day$Date,two_day$Time,sep = ",")
	time <- strptime(dt,format = "%d/%m/%Y,%H:%M:%S")
	png(filename = "plot2.png",width = 480, height = 480, units = "px")
	plot(time,p,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
	dev.off()
}