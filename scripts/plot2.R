
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

png(filename = 'plot_code/plot2.png', width = 480, height =  480, units = 'px')
# Plot data
plot(powerConsumption$DateTime,powerConsumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Close device
dev.off()

