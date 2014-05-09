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

png(filename = "plot4.png",width = 480, height = 480, units = "px",
    bg = "transparent")

par(mfrow = c(2,2))

# Create Plot 4
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),type = "l",
     xlab = "",ylab = "Global Active Power")

plot(data$DateTime,as.numeric(as.character(data$Voltage)),type = "l",
     xlab = "datetime",ylab = "Voltage")
plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),type = "l",
     xlab = "",ylab = "Energy sub metering")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)),col = "red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)),col = "blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,
       col=c("black","red","blue"),bty= "n")

plot(data$DateTime,as.numeric(as.character(data$Global_reactive_power)),type = "l",
     xlab = "datetime",ylab = "Global_reactive_power")


dev.off()
