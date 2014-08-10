#reading the data, assume that the data file is in the folder up from the code
data <- read.table("../household_power_consumption.txt", sep=";")

#taking out the feb data
febdata <- data[data$V1== "1/2/2007" | data$V1 == "2/2/2007",]

#naming the columns
namesdata <- c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(febdata) <- namesdata

#Converting the factor variables to numeric
plotdata <- as.numeric( as.character(febdata$Global_active_power))
plotdate <- as.character(febdata$Date)

#Actual plotting
with(febdata, plot(plotdata,type ="l", ylab="Global Active Power (kilowatts)", xlab="",xaxt="n"))
axis(1,at=c(1,1440,2880),c("Thu","Fri","Sat"))


#Writing to the png file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()