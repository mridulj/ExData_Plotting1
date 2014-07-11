dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';');

colnames(dat) <- names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1));

x <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480);
plot (x,dat$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (x,dat$Sub_metering_2,type = "l", col = "red")
points (x,dat$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off();