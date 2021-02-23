setwd(choose.dir())
df <- read.table(choose.files(),sep=";",header = TRUE,na.strings = "?")

df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$datetime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %T")

png(filename="plot1.png")
hist(df$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
