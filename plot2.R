df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
df$MDate=NULL
df$DT=NULL
df$MDate<-as.Date(strptime(df$Date, format="%d/%m/%Y" ))

df<-subset(df,MDate=="2007-02-01" | MDate=="2007-02-02")
png(filename="plot2.png")
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
plot(df$DT,df$Global_active_power,type="l",lty=1,ylab="Global Active Power (kilowatts)",xlab="")
dev.off()