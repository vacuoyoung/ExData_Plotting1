par(mfcol=c(2,2))

fh <- "household_power_consumption.txt"

dataRaw<-read.table(text = grep("^[1,2]/2/2007",readLines(fh),value = TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),sep = ";",na.strings = "?")

dataRaw$Date<-as.Date(dataRaw$Date,format="%d/%m/5Y")
datatime<- paste(as.Date(dataRaw$Date),dataRaw$Time)

dataRaw$datatime<-as.POSIXct(datetime)

png(filename = "Plot4.png",width=480,height=480)
par(mfcol=c(2,2))


plot(dataRaw$Global_active_power~dataRaw$datatime,xlab="",ylab="Global Active Power (kilowatts)",type="l")

plot(dataRaw$Sub_metering_1~dataRaw$datatime,xlab="",ylab = "Energy sub metering",col="black",type="l")
lines(dataRaw$Sub_metering_2~dataRaw$datatime,xlab="",ylab = "Energy sub metering",col="red",type="l")
lines(dataRaw$Sub_metering_3~dataRaw$datatime,xlab="",ylab = "Energy sub metering",col="blue",type="l")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"))

plot(dataRaw$Voltage~dataRaw$datatime,xlab="datetime",ylab = "Voltage",col="black",type="l")

plot(dataRaw$Global_reactive_power~dataRaw$datatime,xlab="datetime",ylab = "Global_reactive_power",col="black",type="l")

dev.off()