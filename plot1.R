df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
df$Date<-as.Date(strptime(df$Date, format="%d/%m/%Y" ))
df<-subset(df,Date=="2007-02-01" | Date=="2007-02-02")
png(filename="plot1.png")

hist(as.numeric(df$Global_active_power),col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()