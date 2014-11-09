################################################
# James McCammon
# 8 Novemeber 2011
# Exploratory data analysis
# Plot 1 Version 1
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

# Plot data
png(filename = "plot1.png",width = 480, height = 480)
with(data,hist(Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency"))
dev.off()