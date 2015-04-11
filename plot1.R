#source for downloading, unzipping and subsetting data is in another file and shared with the 4 plots
source("readData.R")

plot1 <- function(epc) {
  hist(epc$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
}

plot1png <- function(epc) {
  #using white background as docs says (?png) "Not all PNG viewers render files with transparency correctly."
  #with, height and bg set explicitly for readability, although 480, 480, white are default values
  png(file="plot1.png", width = 480, height = 480, bg = "white") 
  plot1(epc)
  dev.off()
}

plot1png(readData())
