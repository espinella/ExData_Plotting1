## This R file creates a plot named plot2.png in the target directory 
## Author: Ed Spinella for Coursera course: Exploratory Data Analysis
## The data is provided at the following URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Download the data, unzip the file and read into a table
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="powerconsumption.zip")
powerData = read.table(unz("powerconsumption.zip","household_power_consumption.txt"),sep=";",header=TRUE, stringsAsFactors=FALSE)

## Format the date variable
powerData$Date=as.Date(powerData$Date, format="%d/%m/%Y")

## Take a subset of the data that falles within target dates
powerData.subset<-subset(powerData,Date >= "2007-02-01" & Date <= "2007-02-02")

## Paste the Date variable to the Time variable and format
a <- paste(as.character(powerData.subset$Date),as.character(powerData.subset$Time),sep=" ")
b <- strptime(a,format="%Y-%m-%d %H:%M")
powerData.subset$Time <- b
 
# Transform column variables 3-9 from factor to numeric
for (i in 3:9)
{
 powerData.subset[,i] <- as.numeric(as.character(powerData.subset[,i]))
}

##Plot2
png(file="plot2.png",bg="white", width=480,height=480)
plot(powerData.subset$Time,powerData.subset$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")
dev.off()


 


 
