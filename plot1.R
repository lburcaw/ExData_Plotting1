setwd("~/Dropbox/Coursera/Exploratory_Data_Analysis/Project_1/ExData_Plotting1/")

# Read in data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

# Convert date to class "date" and subset
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Convert Time to class type Time
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

# Initialize Graphics Device

png(filename = "plot1.png",width = 480, height = 480, units = "px",
    bg = "transparent")

# Create Plot 1
hist(as.numeric(as.character(data$Global_active_power),breaks=c(0,2,4,6)),
     ylim = c(0,1200),col = 'red',main='Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency')
dev.off()
