#reading the data, assume that the data file is in the folder up from the code
data <- read.table("../household_power_consumption.txt", sep=";")

#taking out the feb data
febdata <- data[data$V1== "1/2/2007" | data$V1 == "2/2/2007",]

#naming the columns
namesdata <- c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(febdata) <- namesdata

#Converting the factor variables to numeric
plotGlobal_active_power <- as.numeric( as.character(febdata$Global_active_power))
plotGlobal_reactive_power <- as.numeric( as.character(febdata$Global_reactive_power))
plotVoltage <- as.numeric( as.character(febdata$Voltage))
plotSub_metering_1 <- as.numeric( as.character(febdata$Sub_metering_1))
plotSub_metering_2 <- as.numeric( as.character(febdata$Sub_metering_2))
plotSub_metering_3 <- as.numeric( as.character(febdata$Sub_metering_3))
plotdate <- as.character(febdata$Date)

#Actual plotting
par(mfrow=c(2,2))
xdata=c(1:2880)

with(febdata, {
    
    plot(plotGlobal_active_power,type="l",xlab="", ylab="Global Active Power",xaxt="n")
    axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))
    
    plot(plotVoltage,type="l",xlab="datetime", ylab="Voltage",xaxt="n")
    axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))
    
    plot(xdata, plotSub_metering_1,type ="l",  xlab="",xaxt="n", ylab ="Energy sub metering")
    lines(xdata, plotSub_metering_2,col="red")
    lines(xdata,plotSub_metering_3,col="blue")
    axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty= c(1,1),lwd=c(2.5,2.5),cex =0.5, text.width=1000)
    
    plot(plotGlobal_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power",xaxt="n")
    axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))
    
    
})

#Writing to the png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()