df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
df$MDate=NULL
df$DT=NULL
df$MDate<-as.Date(strptime(df$Date, format="%d/%m/%Y" ))

df<-subset(df,MDate=="2007-02-01" | MDate=="2007-02-02")
png(filename="plot4.png")
par(mfrow=c(2,2)) 
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
plot(df$DT,df$Global_active_power,type="l",lty=1,ylab="Global Active Power (kilowatts)",xlab="")
plot(df$DT,df$Voltage,type="l",lty=1,ylab="Voltage",xlab="datetime")
plot(df$DT,df$Sub_metering_1,type="l",lty=1,ylab="Energy Sub Metering",xlab="", col="black")
lines(df$DT,df$Sub_metering_2,type="l",lty=1, col="red")
lines(df$DT,df$Sub_metering_3,type="l",lty=1, col="blue")
plot(df$DT,df$Global_reactive_power,type="l",lty=1,xlab="datetime",ylab="Global Reactive Power")
dev.off()