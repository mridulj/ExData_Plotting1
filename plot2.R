dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';');

colnames(dat) <- names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1));

x <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
y <- dat$Global_active_power
png("plot2.png", width=480, height=480);
plot(x,y,type='l',xlab='',ylab='Global Active Power (Kilowatts)')
dev.off();
