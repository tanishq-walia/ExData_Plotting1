datap1=read.table(file ="/media/hduser/New Volume1/course /course1/exploratory-data-analysis/household_power_consumption.txt",sep=";",header = TRUE)
datap1$Date=as.Date(datap1$Date,format="%d/%m/%Y")
class(datap1$Date)
subdata=datap1[(datap1$Date=="2007-02-01")|(datap1$Date=="2007-02-02") ,]
dim(subdata)
class(subdata$Global_active_power)
View(subdata)
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))
class(subdata$Global_active_power)
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata<-transform(subdata,timestamp=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))

#plot 4
plot4 <- function() {
        par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(subdata$timestamp,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(subdata$timestamp,subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(subdata$timestamp,subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(subdata$timestamp,subdata$Sub_metering_2,col="red")
        lines(subdata$timestamp,subdata$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
        plot(subdata$timestamp,subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        #OUTPUT
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        cat("plot4.png has been saved in", getwd())
}
plot4()

