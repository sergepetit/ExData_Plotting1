readData <- function() {
  #I will download in a folder named "data"
  if(!file.exists("data")) {
    dir.create("data")
  }
  
  #if zip is not there, download it
  dataZipFile <- "./data/household_power_consumption.zip"
  if(!file.exists(dataZipFile)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = dataZipFile, method = "curl")
  }
  
  #if uncompressed data is not there, unzip data
  dataFile <- "./data/household_power_consumption.txt"
  if(!file.exists(dataFile)) {
    unzip(dataZipFile, exdir="./data")
  }
  
  #read data
  epc <- read.table(dataFile, header=TRUE, sep=";", na.strings = c("?"), 
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  #subset to the dates 2007-02-01 and 2007-02-02.
  epc <- epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
  
  #combine date and time and convert from character 
  epc$DateTime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
  epc
}