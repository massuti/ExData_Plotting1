
file <- "household_power_consumption.txt"

dat <- read.table(file, header = TRUE, sep = ";", 
                  colClasses = c("character", "character", 
                        rep("numeric",7)), na = "?")

dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

fulltime <- paste(dat$Date, dat$Time)

dat <- cbind(dat, fulltime)

dat$fulltime <- strptime(fulltime, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

plot(dat$fulltime, dat$Global_active_power, 
     type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()