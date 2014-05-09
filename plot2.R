setwd("~/Dropbox/Coursera/Exploratory_Data_Analysis/Project_1/ExData_Plotting1/")

# Read in data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

# Convert date to class "date" and subset
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Convert Time to class type Time
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S")

# Initialize Graphics Device

png(filename = "plot2.png",width = 480, height = 480, units = "px",
    bg = "transparent")

# Create Plot 2
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),type="l",
     xlab = "",ylab="Global Active Power (kilowatts)")

dev.off()
