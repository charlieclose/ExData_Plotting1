plot2 <- function(){
    library(data.table)
    library(dplyr)
    
    alldata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses="character")
    
    #Subset of Feb 1 2007 and Feb 2 2007
    feb <- filter(alldata, Date %in% c("1/2/2007", "2/2/2007"))

    #Remove large data table from memory.
    rm(alldata)
    
    feb$DateTime <- as.POSIXct((paste(feb$Date, feb$Time)), format="%d/%m/%Y %H:%M:%S")
    
    png("plot2.png", width=480, height=480)

    plot(feb$DateTime, as.numeric(feb$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
    par(bg="white")

    dev.off()
}
