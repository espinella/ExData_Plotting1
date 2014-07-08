## This R file creates a histogram named plot1.png in the target directory 
## Author: Ed Spinella for Coursera course: Exploratory Data Analysis
## The data is provided at the following URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

##Download the data, unzip the file and read into a table
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="powerconsumption.zip")
powerData = read.table(unz("powerconsumption.zip","household_power_consumption.txt"),sep=";",header=TRUE)

## Format the date variable
powerData$Date=as.Date(powerData$Date, format="%d/%m/%Y")

## take a subset of the data that falls within target dates
powerData.subset<-subset(powerData,Date >= "2007-02-01" & Date <= "2007-02-02")

#Transform column variables 3-9 from factor to numeric
for (i in 3:9)
{
 powerData.subset[,i] <- as.numeric(as.character(powerData_subset[,i]))
}

## Plot1
png(file="plot1.png",bg="white", width=480,height=480)
hist(powerData.subset$Global_active_power, xlab="Global Active Power (kilowatts)", main ="Global Active Power", col="red")
dev.off()



