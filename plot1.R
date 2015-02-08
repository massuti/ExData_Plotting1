
file <- "household_power_consumption.txt"

dat <- read.table(file, header = TRUE, sep = ";", 
                  colClasses = c("character", "character", 
                rep("numeric",7)), na = "?")

dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

hist(dat$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",breaks = 12, 
     ylim = c(0, 1200))

dev.off()
