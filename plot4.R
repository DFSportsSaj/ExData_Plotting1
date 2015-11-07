
#################################################################
#set working directory to location of text file that contains data
##################################################################



#Import Data
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";",colClasses= c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
data<-subset(data, Date =="1/2/2007"| Date== "2/2/2007")
data$datetime <-strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")



#plot4.R
png(filename = "plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

#plot 1
with(data
     ,plot(datetime,Global_active_power
           ,xlab = ""
           ,ylab =  "Global Active Power"
           ,type = "l"
     )
)

#plot 2
with(data
     ,plot(datetime,Voltage
           ,type = "l"
     )
)

#plot 3
with(data
     ,plot(datetime,Sub_metering_1
           ,xlab = ""
           ,ylab =  "Energy sub metering"
           ,type = "n"
     )
)
with(data
     ,lines(datetime,Sub_metering_1
     )
)
with(data
     ,lines(datetime,Sub_metering_2
            ,col = "red"
     )
)
with(data
     ,lines(datetime,Sub_metering_3
            ,col = "blue"
     )
)  
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("black", "red", "blue"), lty = 1, lwd = 1)

#plot 4
with(data
     ,plot(datetime,Global_reactive_power
           ,type = "l"
     )
)

dev.off()
