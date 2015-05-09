plot1 <- function(){
    library(data.table)
    library(dplyr)
    
    alldata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses="character")
    
    #Subset of Feb 1 2007 and Feb 2 2007
    feb <- filter(alldata, Date %in% c("1/2/2007", "2/2/2007"))

    #Remove large data table from memory.
    rm(alldata)
    
    png("plot1.png", width=480, height=480)

    hist(as.numeric(feb$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    par(bg="white")
    axis(side=2, at=seq(0, 1200, by=200))

    dev.off()
}
