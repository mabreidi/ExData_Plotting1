setwd(choose.dir())
df <- read.table(choose.files(),sep=";",header = TRUE,na.strings = "?")

df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$datetime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %T")

png(filename="plot4.png")
par(mfrow=c(2,2))
with(df,plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))

with(df,plot(datetime,Voltage,type="l"))

with(df,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(df,lines(datetime,Sub_metering_2,type="l",col="red"))
with(df,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"))

with(df,plot(datetime,Global_reactive_power,type="l"))
dev.off()
