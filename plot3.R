
file <- "household_power_consumption.txt"

dat <- read.table(file, header = TRUE, sep = ";", 
                  colClasses = c("character", "character", 
                                 rep("numeric",7)), na = "?")

dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

fulltime <- paste(dat$Date, dat$Time)

dat <- cbind(dat, fulltime)

dat$fulltime <- strptime(fulltime, "%d/%m/%Y %H:%M:%S")

rownames(dat) <- 1:nrow(dat)

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(dat$fulltime, dat$Sub_metering_1, type = "l",
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(dat$fulltime, dat$Sub_metering_2, col = "red")
lines(dat$fulltime, dat$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()