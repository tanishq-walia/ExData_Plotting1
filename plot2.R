datap1=read.table(file ="/media/hduser/New Volume1/course /course1/exploratory-data-analysis/household_power_consumption.txt",sep=";",header = TRUE)
datap1$Date=as.Date(datap1$Date,format="%d/%m/%Y")
class(datap1$Date)
subdata=datap1[(datap1$Date=="2007-02-01")|(datap1$Date=="2007-02-02") ,]
dim(subdata)
class(subdata$Global_active_power)
View(subdata)
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))

subdata<-transform(subdata,timestamp=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")




#plot2

plot2 <- function() {
        plot(subdata$timestamp,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
}
plot2()
