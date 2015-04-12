
# set language

language = 'EN'
# Set working directory

setwd('C:/Users/Usuario/ExData_Plotting1')

# Create folder if it does not exist

if(!file.exists('plot_code')){
  dir.create('plot_code')
}

# Load data
source('scripts/getAndClean.R')
powerConsumption$DateTime <- as.POSIXct(powerConsumption$DateTime)

# Open device
setwd('C:/Users/Usuario/ExData_Plotting1')

png(filename = 'plot_code/plot4.png', width = 480, height =  480, units = 'px')

# 4 plots

par(mfrow = c(2,2))

# Plot (1,1)
plot(powerConsumption$DateTime,powerConsumption$GlobalActivePower,type='l',col='black',xlab='',ylab='Voltage')
# Plot (1,2)
plot(powerConsumption$DateTime,powerConsumption$Voltage,type='l',col='black',xlab='datetime',ylab='Voltage')

# Plot (2,1)

plot(powerConsumption$DateTime,powerConsumption$SubMetering1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(powerConsumption$DateTime,powerConsumption$SubMetering2,col='red')
lines(powerConsumption$DateTime,powerConsumption$SubMetering3,col='blue')

# legend
labels <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
legend('topright',legend = labels, col = c('black', 'red', 'blue'), lty='solid')

# Plot (2,2)
plot(powerConsumption$DateTime,powerConsumption$GlobalReactivePower,type='l',col='black',xlab='datetime',ylab='Global_reactive_power')

# Close device
dev.off()

