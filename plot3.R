Data <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
refined_Data <- subset(Data,Data$Date=="1/2/2007" | Data$Date=="2/2/2007")
refined_Data$Date <- as.Date(refined_Data$Date, format="%d/%m/%Y")
refined_Data$Time <- strptime(refined_Data$Time, format="%H:%M:%S")
refined_Data[1:1440,"Time"] <- format(refined_Data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
refined_Data[1441:2880,"Time"] <- format(refined_Data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(refined_Data$Time,refined_Data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(refined_Data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(refined_Data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(refined_Data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png("plot3.png",width = 480,height = 480)
dev.off()