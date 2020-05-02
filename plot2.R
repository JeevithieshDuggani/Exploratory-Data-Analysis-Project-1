##  Load the data
house_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##  Separate the data belonging to the required dates
plot_data <- house_power_cons[house_power_cons$Date %in% c("1/2/2007", "2/2/2007"),]
##  Create plot2.png
png("plot2.png", width = 480, height = 480)
##  Plot the graph
plot(strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S"),
     as.numeric(plot_data$Global_active_power),
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l"
)
##  Close the graphic device
dev.off()
##  end