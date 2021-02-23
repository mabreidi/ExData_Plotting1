setwd(choose.dir())
df <- read.table(choose.files(),sep=";",header = TRUE,na.strings = "?")

df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$datetime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %T")

png(filename="plot2.png")
with(df,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()

