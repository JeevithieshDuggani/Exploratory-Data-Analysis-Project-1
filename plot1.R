##  Load the data
house_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##  Separate the data belonging to the required dates
plot_data <- house_power_cons[house_power_cons$Date %in% c("1/2/2007", "2/2/2007"),]
##  Create plot1.png
png("plot1.png")
##  Plot the graph
hist(as.numeric(plot_data$Global_active_power),
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col  = "red" 
)
##  close the graphic device (png)
dev.off()
##  end