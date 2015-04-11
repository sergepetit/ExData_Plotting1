#source for downloading, unzipping and subsetting data is in another file and shared with the 4 plots
source("readData.R")

plot4 <- function(epc){
  par(mfrow = c(2,2))
  plot(epc$DateTime, epc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
  plot(epc$DateTime, epc$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  
  plot(epc$DateTime, epc$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(x = epc$DateTime, y=epc$Sub_metering_1, col="black")
  lines(x = epc$DateTime, y=epc$Sub_metering_2, col="red")
  lines(x = epc$DateTime, y=epc$Sub_metering_3, col="blue")
  legend("topright", bty="n", lty=c(1,1), col = c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(epc$DateTime, epc$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
}

plot4png <- function(epc) {
  #using white background as docs says (?png) "Not all PNG viewers render files with transparency correctly."
  #with, height and bg set explicitly for readability, although 480, 480, white are default values
  png(file="plot4.png", width = 480, height = 480, bg = "white") 
  plot4(epc)
  dev.off()
}

plot4png(readData())
