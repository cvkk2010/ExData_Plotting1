
# Read Data from Text file

da = read.table("household_power_consumption.txt", sep = ";", header = T,
                as.is = T)

# Convert Date Column from Char to Date and Generate Time series

da$Date = as.Date(da$Date, "%d/%m/%Y")
da$DateTime = as.POSIXct(paste(da$Date,da$Time), format = "%Y-%m-%d %H:%M:%S")

# Subsetting Data between "2007-02-01" and "2007-02-02"

plot_data = subset(da, Date >= "2007-02-01" & Date <= "2007-02-02")

# Generate plot and save the plot as png

png(filename = "plot3.png", width = 480, height = 480, units = "px")


plot(plot_data$DateTime,plot_data$Sub_metering_1, xaxt="n", type = "l",
     xlab = "", ylab = "Energy sub metering")

# Adding multiple data sets
points(plot_data$DateTime,plot_data$Sub_metering_2, col="red", type = "l")
points(plot_data$DateTime,plot_data$Sub_metering_3, col="blue", type = "l")

# Adding X axis points
axis.POSIXct( side = 1, at = plot_data$Date)

# Adding Legend

legend("topright",legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       col = c("black","red","blue"), lty=1, cex=0.8)
       
dev.off()


