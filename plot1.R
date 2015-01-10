#Exploratory Data Analysis, course project 1, plot 1

#The below reads and subsets the original file.  A slow method, but I went with what I 
#was certain about, and aspects of the grep syntax have eluded me.  

longform <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings=c("?", ""))
shortform <- longform[longform$Date %in% c("1/2/2007", "2/2/2007"), ]

#The below adds a column for DateTime in appropriate format.  
shortform$DateTime <- as.POSIXct(paste(shortform$Date, shortform$Time), format="%d/%m/%Y %H:%M:%S") 

#The below makes plot1.  

hist(shortform$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#The below copies plot1 to a png device and closes the device.  

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()