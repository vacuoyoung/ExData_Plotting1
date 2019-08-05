#Plot2 reading from raw data, only selective date to reduce amount of memory required 

fh <- "household_power_consumption.txt"
dataRaw<-read.table(text = grep("^[1,2]/2/2007",readLines(fh),value = TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),sep = ";",na.strings = "?")

dataRaw$Date<-as.Date(dataRaw$Date,format="%d/%m/5Y")
datatime<- paste(as.Date(dataRaw$Date),dataRaw$Time)

dataRaw$datatime<-as.POSIXct(datetime)

png(filename = "Plot2.png",width=480,height=480)

plot(dataRaw$Global_active_power~dataRaw$datatime,xlab="",ylab="Global Active Power (kilowatts)",type="l")

dev.off()

