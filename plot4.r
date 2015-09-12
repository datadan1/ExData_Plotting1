#Exploratory data analysis Project 1 part 4

wd <- "C:/Temp/rprogclass/exploratory_analysis/"
setwd(wd)

#Read file and get only necessary information for ease of processing
file=paste(wd,"data/household_power_consumption.txt",sep="")
raw_data <- read.csv(file,header=T,sep=";")
raw_data_sub1 <- raw_data
raw_data_sub1$Date <- as.Date(raw_data_sub1$Date, format = "%d/%m/%Y")
raw_data_sub2 <- subset(raw_data_sub1,raw_data_sub1$Date=="2007-02-01"|raw_data_sub1$Date=="2007-02-02")

##########################
# Prepare Data
#########################
x <- paste(raw_data_sub2$Date,raw_data_sub2$Time)
t <- strptime(x,"%Y-%m-%d %H:%M:%S")
ga <- as.numeric(levels(raw_data_sub2[,3])[raw_data_sub2[,3]])
gr <- as.numeric(levels(raw_data_sub2[,4])[raw_data_sub2[,4]])
volt <- as.numeric(levels(raw_data_sub2[,5])[raw_data_sub2[,5]])
subm1 <- as.numeric(levels(raw_data_sub2[,7])[raw_data_sub2[,7]])
subm2 <- as.numeric(levels(raw_data_sub2[,8])[raw_data_sub2[,8]])
subm3 <- raw_data_sub2[,9]
dat <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

#########################
# Plot and Export
#########################

loc_name <- paste(wd,"project/ExData_Plotting1/plot4.png",sep="")
png(loc_name)
par(mfrow=c(2,2))
  plot(t,ga,type="line",xlab=" ",ylab="Global Active Power")
  plot(t,volt,type="line",ylab="Voltage",xlab="datetime")
  plot(t,subm1,col="black",ylab="Energy sub metering",xlab="",type="n")
    lines(t,subm1,col="black")
    lines(t,subm2,col="red")
    lines(t,subm3,col="blue")
    legend("topright",legend=dat, lty=c(1,1,1),col=c("black","red","blue"))
    plot(t,gr,type="line",xlab="datetime",ylab="Global_reactive_power")
dev.off()