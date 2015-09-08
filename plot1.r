#Course Project 1, part 1
wd <- "C:/Temp/rprogclass/exploratory_analysis/"
setwd(wd)
# Read the file:
file=paste(wd,"data/household_power_consumption.txt",sep="")
raw_data <- read.csv(file,header=T,sep=";")
raw_data_sub1 <- raw_data
raw_data_sub1$Date <- as.Date(raw_data_sub1$Date, format = "%d/%m/%Y")
raw_data_sub2 <- subset(raw_data_sub1,raw_data_sub1$Date=="2007-02-01"|raw_data_sub1$Date=="2007-02-02")
###########################################
# Plot 1 histogram and export
##########################################
plot1 <- as.numeric(levels(raw_data_sub2$Global_active_power)[raw_data_sub2$Global_active_power])

loc_name <- paste(wd,"project1/plot1.png",sep="")  
png(loc_name)
hist(plot1,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     breaks=12)
dev.off()