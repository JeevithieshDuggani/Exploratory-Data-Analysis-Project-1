##  Load the data
house_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##  Separate the data belonging to the required dates
plot_data <- house_power_cons[house_power_cons$Date %in% c("1/2/2007", "2/2/2007"),]
##  Store date-time in a new variable
datetime <- strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
##  Create plot4.png
png("plot4.png", width = 720, height = 720)
##  set mfrow to (2,2)
par(mfrow = c(2,2))
##  Plot graph 1
plot(datetime,
     as.numeric(plot_data$Global_active_power),
     xlab = "",
     ylab = "Global Active Power",
     type = "l",
     lwd  = 0.5
)
##  Plot graph 2
plot(datetime,
     as.numeric(plot_data$Voltage),
     xlab = "datetime",
     ylab = "Voltage",
     type = "l"
)
##  Plot graph 3
#   Plot sub metering 1
plot(time,
     as.numeric(plot_data$Sub_metering_1),
     xlab = "",
     ylab = "Energy sub metering",
     type = 'l'
)
#   Plot sub metering 2
lines(time,
      as.numeric(plot_data$Sub_metering_2),
      col  = "red",
      type = "l"
)
#   Plot sub metering 3
lines(time,
      as.numeric(plot_data$Sub_metering_3),
      col  = "blue",
      type = "l"
)
#   Add legend in the top right corner
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 1,
       col = c("black", "red", "blue"),
       bty = "n"
)
##  Plot graph 4
plot(datetime,
     as.numeric(plot_data$Global_reactive_power),
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l"
)
##  close the graphic window
dev.off()
##  end