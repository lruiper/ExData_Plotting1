#Set working directory

setwd('C:/Users/Usuario/ExData_Plotting1')

#Create data directory

if(!file.exists('data')){
  dir.create('data')
}

# required packages
library(data.table)
library(lubridate)



if (!file.exists('data/power_consumption.txt')) {
  
  # download the zip file and unzip
  file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url, destfile='data/power_consumption.zip')
  unzip('data/power_consumption.zip', exdir='data', overwrite = TRUE)
  
  # read raw data from  2007-02-01 to 2007-02-02
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  fileToRead <- 'data/household_power_consumption.txt'
  powerConsumption<-read.table(text = grep("^[1,2]/2/2007", readLines(fileToRead), value = TRUE),col.names = cols, sep = ';', header = TRUE, na.strings = '?')
  powerConsumption$DateTime <-dmy(powerConsumption$Date) + hms(powerConsumption$Time)
  
  powerConsumption$Date <- as.Date(powerConsumption$Date, format = '%d/%m/%Y')
  powerConsumption$Time <- strptime(powerConsumption$Time, format = '%H:%M:%S')
  
  powerConsumption <- powerConsumption[,c(10,3:9)]
  
  
  # write a clean data set to the directory
  write.table(powerConsumption,file='data/power_consumption.txt',sep='|',row.names=FALSE)
} else {
  
  powerConsumption<-read.table('data/power_consumption.txt',header=TRUE,sep='|')
  #power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  
}

if (file.exists('data/household_power_consumption.txt')) {
  x<-file.remove('data/household_power_consumption.txt')
}

