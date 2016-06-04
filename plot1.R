plot1 <- function(){
	power <- read.table("power.txt",sep = ";",header = T, stringsAsFactors = F)
	two_day <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")
	p <- as.numeric(two_day$Global_active_power)
	png(filename = "plot1.png",width = 480, height = 480, units = "px")
	hist(p,col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
	dev.off()
}