plot3 <- function(){
    library(data.table)
    library(dplyr)
    
    alldata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses="character")
    
    #Subset of Feb 1 2007 and Feb 2 2007
    feb <- filter(alldata, Date %in% c("1/2/2007", "2/2/2007"))
    
    #Remove large data table from memory.
    rm(alldata)
    
    feb$DateTime <- as.POSIXct((paste(feb$Date, feb$Time)), format="%d/%m/%Y %H:%M:%S")
    
    png("plot3.png", width=480, height=480)
    
    plot(feb$DateTime, as.numeric(feb$Sub_metering_1), col="black", type="l", xlab="", ylab="Energy sub metering")
    lines(feb$DateTime, as.numeric(feb$Sub_metering_2), col="red")
    lines(feb$DateTime, as.numeric(feb$Sub_metering_3), col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    par(bg="white")
    
    dev.off()
}
