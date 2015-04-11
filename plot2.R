#source for downloading, unzipping and subsetting data is in another file and shared with the 4 plots
source("readData.R")

plot2 <- function(epc) {
  plot(epc$DateTime, epc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")  
}

plot2png <- function(epc) {
  #using white background as docs says (?png) "Not all PNG viewers render files with transparency correctly."
  #with, height and bg set explicitly for readability, although 480, 480, white are default values
  png(file="plot2.png", width = 480, height = 480, bg = "white") 
  plot2(epc)
  dev.off()
}

plot2png(readData())
