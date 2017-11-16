# install.packages("chron")

getwd()
setwd("/Users/moritzfleischmann/Documents/coursera")

library(chron)

dat <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = c(rep("character", 9)))
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat$time <- paste(dat$Date, dat$Time, sep = "/")
dat$time <- strptime(dat$time, "%d/%m/%Y/%H:%M:%S")
dat[,3:9] <- sapply(dat[,3:9], as.numeric)
sapply(dat, class)


setwd("/Users/moritzfleischmann/Documents/coursera/ExData_Plotting1-master")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dat$time, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dat$time, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(dat$time, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat$time, dat$Sub_metering_2, col = "red")        
lines(dat$time, dat$Sub_metering_3, col = "blue") 
legend("topright", legend = c("Sub_metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(dat$time, dat$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()