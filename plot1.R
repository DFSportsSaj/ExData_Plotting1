
#################################################################
#set working directory to location of text file that contains data
##################################################################



#Import Data
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";",colClasses= c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
data<-subset(data, Date =="1/2/2007"| Date== "2/2/2007")
data$datetime <-strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")




#plot1.R
png(filename = "plot1.png",
    width = 480, height = 480)

with(data, 
     hist(
         Global_active_power
         , main= "Global Active Power"
         , xlab = "Global Active Power (kilowatts)"
         , col="red"
     )
)
dev.off()