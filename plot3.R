#reading the data, assume that the data file is in the folder up from the code
data <- read.table("../household_power_consumption.txt", sep=";")

#taking out the feb data
febdata <- data[data$V1== "1/2/2007" | data$V1 == "2/2/2007",]

#naming the columns
namesdata <- c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(febdata) <- namesdata

#Converting the factor variables to numeric
plotdata1 <- as.numeric( as.character(febdata$Sub_metering_1))
plotdata2 <- as.numeric( as.character(febdata$Sub_metering_2))
plotdata3 <- as.numeric( as.character(febdata$Sub_metering_3))
plotdate <- as.character(febdata$Date)

#Actual plotting
#with(febdata, plot(plotdata1,type ="l",  xlab="",xaxt="n"))
#with(febdata, plot(plotdata1,type ="l",  xlab="",xaxt="n"))
#with(febdata, plot(plotdata1,type ="l",  xlab="",xaxt="n"))
xdata=c(1:2880)

plot(xdata, plotdata1,type ="l",  xlab="",xaxt="n", ylab ="Energy sub metering")
lines(xdata, plotdata2,col="red")
lines(xdata,plotdata3,col="blue")


axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty= c(1,1),lwd=c(2.5,2.5),cex=0.5,text.width=500)

#Writing to the png file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()