library(data.table)
data <- fread('household_power_consumption.txt',
              na.strings = '?',
              colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


neatData <- data[Date %in% c("1/2/2007","2/2/2007"), ]


dateAndTime =  as.POSIXct(strptime(paste(neatData$Date,neatData$Time),format='%d/%m/%Y %H:%M:%S'))


png('plot4.png', width = 480, height = 480)

par(mfrow=c(2,2))
#plot1:
plot(neatData$Global_active_power~dateAndTime, xlab = '', ylab = 'Global Active Power (killowatts)', type ='l')
#plot2:
plot(neatData$Voltage~dateAndTime, xlab = 'datetime', ylab = 'Voltage', type ='l')
#plot3:
plot(neatData$Sub_metering_1~dateAndTime, xlab = '', ylab = 'Global Active Power (killowatts)', type ='l')
lines(neatData$Sub_metering_2~dateAndTime, type ='l',col = 'red')
lines(neatData$Sub_metering_3~dateAndTime, type ='l',col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col =c('black','red','blue'),lty = 1)
#plot4:
plot(neatData$Global_reactive_power~dateAndTime, xlab = 'datetime', ylab = 'Voltage', type ='l')

dev.off()
