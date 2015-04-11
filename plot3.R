#source for downloading, unzipping and subsetting data is in another file and shared with the 4 plots
source("readData.R")

plot3 <- function(epc) {
  plot(epc$DateTime, epc$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(x = epc$DateTime, y=epc$Sub_metering_1, col="black")
  lines(x = epc$DateTime, y=epc$Sub_metering_2, col="red")
  lines(x = epc$DateTime, y=epc$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), col = c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

plot3png <- function(epc) {
  #using white background as docs says (?png) "Not all PNG viewers render files with transparency correctly."
  #with, height and bg set explicitly for readability, although 480, 480, white are default values
  png(file="plot3.png", width = 480, height = 480, bg = "white") 
  plot3(epc)
  dev.off()
}

plot3png(readData())
