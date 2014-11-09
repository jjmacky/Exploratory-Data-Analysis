################################################
# James McCammon
# 8 Novemeber 2011
# Exploratory data analysis
# Plot 4 Version 1
################################################

# Load data.table to use fread
require(data.table)
# Read file in from directory
directory <- setwd("~/Coursera Classes/Exploratory data anlysis")
fileList <- list.files(directory)
file <- fileList[[1]]
skip <- (31 + 15) * 60*24 + 60*6 + (60-24) + 1 # calculate location of data
nrows <- 60*24*2 # calculate size of data
data <- fread(file,sep=";",nrows=nrows,skip=skip,header="auto",na.strings="?")
# Set column names
setnames(data,names(fread(file,nrow=0)))
# Combine date and time
datetime <- with(data,strptime(paste(Date,Time),"%d/%m/%Y %T"))

# Plot data
par(mfrow=c(2,2))
par(mar=c(4,4.1,2,1))
# Plot 1
with(data,plot(x=datetime,y=Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
# Plot 2
with(data,plot(x=datetime,y=Voltage,type="l",ylab="Voltage"))
# Plot 3
with(data,plot(x=datetime,y=Sub_metering_1,ylim=c(0,40),type="l",ylab="Energy sub metering",xlab=""))
with(data,lines(x=datetime,y=Sub_metering_2,col="red",type="l"))
with(data,lines(x=datetime,y=Sub_metering_3,col="blue",type="l"))
legend("top",
       col=c("black","red","blue"),
       lty=c(1,1,1),
       cex=0.7,
       bty = "n",
       legend=c(
         "Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"))
# Plot 4
with(data,plot(x=datetime,y=Global_reactive_power,type="l"))
# Save and reset
dev.copy(png, file = "plot4.png",width = 480, height = 480) 
dev.off()
par(mfrow=c(1,1))
par(mar=c(5.1,4.1,4.1,2.1))