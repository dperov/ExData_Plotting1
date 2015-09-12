library("readr")

# set english locale (otherwise weekdays on graph may be on local language)
Sys.setlocale("LC_ALL","English")

# read_csv2 is MUCH quicker than read.cvs2
data <- read_csv2("household_power_consumption.txt", na = "?")
# only data for Feb 1 and Feb 2 is needed
data0 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
# construct new column with POSIX datetime
data0$DateTime <- strptime(paste(data0$Date,data0$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width = 480, height = 480)

plot(data0$DateTime, data0$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data0$DateTime, data0$Global_active_power)

dev.off()
