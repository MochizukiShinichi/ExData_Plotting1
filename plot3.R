library(data.table)
data <- fread('household_power_consumption.txt',
              na.strings = '?',
              colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


neatData <- data[Date %in% c("1/2/2007","2/2/2007"), ]


dateAndTime =  as.POSIXct(strptime(paste(neatData$Date,neatData$Time),format='%d/%m/%Y %H:%M:%S'))


png('plot3.png', width = 480, height = 480)
plot(neatData$Sub_metering_1~dateAndTime, xlab = '', ylab = 'Global Active Power (killowatts)', type ='l')
lines(neatData$Sub_metering_2~dateAndTime, type ='l',col = 'red')
lines(neatData$Sub_metering_3~dateAndTime, type ='l',col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col =c('black','red','blue'),lty = 1)
dev.off()

