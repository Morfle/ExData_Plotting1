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
png("plot2.png", width = 480, height = 480)
plot(dat$time, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
