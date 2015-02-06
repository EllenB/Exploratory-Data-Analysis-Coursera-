#######################################
## Project 1: Exploratory Data Analysis

## Ellen Brock
#######################################

## 1. Setting the working directory
setwd("E:/Ellen/coursera/ExpDatAn/project_1")

## 2. Reading in the data
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",
                   stringsAsFactors=F)
names(data)## Gives the names of which variables in the dataset
dim(data) #2075259    9: To check if we have read in the correct number of obs
str(data)

## 3. Change the data format:
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

## 4. Subset the data to the period: from the following two days 2007-02-01 and 2007-02-02
data_short <-data[which(data$Date=='2007-02-01'|
                           data$Date=='2007-02-02'),]
## remove the row.names
row.names(data_short) <- NULL

## remove the original dataset from the directory
rm(data)

## 5. Create one variable that specifies the day and the time through the 
##    "paste" command and putting it in the date format
data_short$DateTime <- paste(data_short$Date, data_short$Time)
data_short$DateTime <- as.POSIXct(data_short$DateTime)

## 6. Create the plot and save this into a png file:
png(filename="plot2.png", width=480,height=480) 

plot(data_short$Global_active_power~data_short$DateTime, type="l", 
ylab="Global Active Power (kilowatts)",xlab="") 

dev.off()



                  
