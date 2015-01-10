#Exploratory Data Analysis, course project 1, plot 3

#The below reads and subsets the original file.  A slow method, but I went with what I 
#was certain about, and aspects of the grep syntax have eluded me.  

longform <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings=c("?", ""))
shortform <- longform[longform$Date %in% c("1/2/2007", "2/2/2007"), ]

#The below adds a column for DateTime in appropriate format.  
shortform$DateTime <- as.POSIXct(paste(shortform$Date, shortform$Time), format="%d/%m/%Y %H:%M:%S") 

#The below opens a PNG device

png(file = "plot3.png", width = 480, height = 480)

#The below makes the blank plot 3.  I suppose I could have gone ahead
#and put the first line on here, but I was experimenting with 
#putting multiple lines on the graph.  

with(shortform, 
     plot(DateTime, Sub_metering_1,
                     xlab = "",
                     ylab = "Energy sub metering",
                     type = "n"))

#The below adds lines to the graph.    

points(shortform$DateTime, shortform$Sub_metering_1, type = "l", col = "black")
points(shortform$DateTime, shortform$Sub_metering_2, type = "l", col = "red")
points(shortform$DateTime, shortform$Sub_metering_3, type = "l", col = "blue")

#and adds a legend

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       lwd = c(1, 1, 1)
       )

#and closes the device. 

dev.off()