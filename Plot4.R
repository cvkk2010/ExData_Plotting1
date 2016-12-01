
# Read Data from Text file

da = read.table("household_power_consumption.txt", sep = ";", header = T,
                as.is = T)

# Convert Date Column from Char to Date and Generate Time series

da$Date = as.Date(da$Date, "%d/%m/%Y")
da$DateTime = as.POSIXct(paste(da$Date,da$Time), format = "%Y-%m-%d %H:%M:%S")

# Subsetting Data between "2007-02-01" and "2007-02-02"

plot_data = subset(da, Date >= "2007-02-01" & Date <= "2007-02-02")

# Generate plot and save the plot as png

png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set Margin

par(mfrow=c(2,2))
par(cex = 0.5)


# Plot Global Active Power

plot(plot_data$DateTime,plot_data$Global_active_power, xaxt="n", type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

axis.POSIXct( side = 1, at = plot_data$Date)


# Plot Voltage
plot(plot_data$DateTime,plot_data$Voltage, xaxt="n", type = "l",
     xlab = "", ylab = "Voltage")

axis.POSIXct( side = 1, at = plot_data$Date)


# Plot Energy Sub Metering

plot(plot_data$DateTime,plot_data$Sub_metering_1, xaxt="n", type = "l",
     xlab = "", ylab = "Energy sub metering")

# Adding multiple data sets
points(plot_data$DateTime,plot_data$Sub_metering_2, col="red", type = "l")
points(plot_data$DateTime,plot_data$Sub_metering_3, col="blue", type = "l")

# Adding X axis points
axis.POSIXct( side = 1, at = plot_data$Date)

# Adding Legend
op <- par(cex = 0.5)
legend("topright",legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       col = c("black","red","blue"),lty = 1, cex = 1.2, bty = "n", xjust = 1, yjust = 1)


# Plot Global Reactive Power

plot(plot_data$DateTime,plot_data$Global_reactive_power, xaxt="n", type = "l",
     xlab = "", ylab = "Global_Reactive_Power")

axis.POSIXct( side = 1, at = plot_data$Date)


dev.off()


