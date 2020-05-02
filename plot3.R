##  Load the data
house_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##  Separate the data belonging to the required dates
plot_data <- house_power_cons[house_power_cons$Date %in% c("1/2/2007", "2/2/2007"),]
##  Create plot3.png
png("plot3.png", width = 480, height = 480)
##  Store date-time in a new variable
time <- strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
##  Plot sub metering 1
plot(time,
     as.numeric(plot_data$Sub_metering_1),
     xlab = "",
     ylab = "Energy sub metering",
     type = 'l'
)
##  Plot sub metering 2
lines(time,
      as.numeric(plot_data$Sub_metering_2),
      col  = "red",
      type = "l"
)
##  Plot sub metering 3
lines(time,
      as.numeric(plot_data$Sub_metering_3),
      col  = "blue",
      type = "l"
)
##  Add legend in the top right corner
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue")
)
##  close the graphic window
dev.off()
##  end