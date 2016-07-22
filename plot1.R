library(data.table)
data <- fread('household_power_consumption.txt',
              na.strings = '?',
              colClasses = c('Date','POSIXlt','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data[ , Date := as.Date(Date,'%d/%m/%Y')]
neatData <- data[Date  %in%  c(as.Date("2007-02-01"),as.Date("2007-02-02"))]


png('plot1.png', width = 480, height = 480)
hist(neatData$Global_active_power,col='red',main = 'Global Active Power',xlab = 'Global Active Power (killowatts)')
dev.off()