
# Set working directory

setwd('C:/Users/Usuario/ExData_Plotting1')

# Create folder if it does not exist

if(!file.exists('plot_code')){
  dir.create('plot_code')
}

# Load data
source('scripts/getAndClean.R')

# Open device
setwd('C:/Users/Usuario/ExData_Plotting1')

png(filename = 'plot_code/plot1.png', width = 480, height =  480, units = 'px')

# Plot data

hist(powerConsumption$GlobalActivePower, main = 'Global Active Power', xlab = 'Goblab Active Power (kilowatts)', ylab = 'Frequency', col = 'red')

# Close device
x<-dev.off()

