################################################
# James McCammon
# 8 Novemeber 2011
# Exploratory data analysis
# Plot 3 Version 1
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
png(filename = "plot3.png",width = 480, height = 480)
with(data,plot(x=datetime,y=Sub_metering_1,ylim=c(0,40),type="l",ylab="Energy sub metering",xlab=""))
with(data,lines(x=datetime,y=Sub_metering_2,col="red",type="l"))
with(data,lines(x=datetime,y=Sub_metering_3,col="blue",type="l"))
legend("topright",
       col=c("black","red","blue"),
       lty=c(1,1,1),
       legend=c(
       "Sub_metering_1",
       "Sub_metering_2",
       "Sub_metering_3"))
dev.off()

