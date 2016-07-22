library(data.table)
data <- fread('household_power_consumption.txt',
              na.strings = '?',
              colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


neatData <- data[Date %in% c("1/2/2007","2/2/2007"), ]


dateAndTime =  as.POSIXct(strptime(paste(neatData$Date,neatData$Time),format='%d/%m/%Y %H:%M:%S'))


png('plot2.png', width = 480, height = 480)
plot(neatData$Global_active_power~dateAndTime, xlab = '', ylab = 'Global Active Power (killowatts)', type ='l')
dev.off()

