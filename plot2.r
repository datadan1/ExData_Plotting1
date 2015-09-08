#Course Project part 2
wd <- "C:/Temp/rprogclass/exploratory_analysis/"
setwd(wd)
# Memory calculation:
#2075259*9 = .017 GB
#Read file and get only necessary information for ease of processing
file=paste(wd,"data/household_power_consumption.txt",sep="")
raw_data <- read.csv(file,header=T,sep=";")
raw_data_sub1 <- raw_data
raw_data_sub1$Date <- as.Date(raw_data_sub1$Date, format = "%d/%m/%Y")
raw_data_sub2 <- subset(raw_data_sub1,raw_data_sub1$Date=="2007-02-01"|raw_data_sub1$Date=="2007-02-02")
##########################################
# Prepare data
##########################################
plot1 <- as.numeric(levels(raw_data_sub2$Global_active_power)[raw_data_sub2$Global_active_power])
x <- paste(raw_data_sub2$Date,raw_data_sub2$Time)
t <- strptime(x,"%Y-%m-%d %H:%M:%S")
##########################################
# Plot 2 and Export
##########################################
loc_name <- paste(wd,"project1/plot2.png",sep="")
png(loc_name)
plot(t,plot1,
     type="line",
     ylab="Global Active Power (kilowatts)",
     xlab=" ",
     main="Global Active Power usage 2/1/2007 - 2/2/2007")
dev.off()