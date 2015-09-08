#Expoloratory Data Course Project 1, part 3
# Data set:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
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
######################
#Prepare the data
######################
x <- paste(raw_data_sub2$Date,raw_data_sub2$Time)
t <- strptime(x,"%Y-%m-%d %H:%M:%S")
subm1 <- as.numeric(levels(raw_data_sub2[,7])[raw_data_sub2[,7]])
subm2 <- as.numeric(levels(raw_data_sub2[,8])[raw_data_sub2[,8]])
subm3 <- raw_data_sub2[,9]
dat <- c("Sub_metering1","Sub_metering2","Sub_metering3")
########################
#Now plot & Export
########################

loc_name <- paste(wd,"project1/plot3.png",sep="")
png(loc_name)
plot(t,subm1,col="black",ylab="Energy sub metering",xlab="",type="n")
lines(t,subm1,col="black")
lines(t,subm2,col="red")
lines(t,subm3,col="blue")
legend("topright",legend=dat, lty=c(1,1,1),col=c("black","red","blue")) 
dev.off()