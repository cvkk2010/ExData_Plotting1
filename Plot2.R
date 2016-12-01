
# Read Data from Text file

da = read.table("household_power_consumption.txt", sep = ";", header = T,
                as.is = T)

# Convert Date Column from Char to Date and Generate Time series

da$Date = as.Date(da$Date, "%d/%m/%Y")
da$DateTime = as.POSIXct(paste(da$Date,da$Time), format = "%Y-%m-%d %H:%M:%S")

# Subsetting Data between "2007-02-01" and "2007-02-02"

plot_data = subset(da, Date >= "2007-02-01" & Date <= "2007-02-02")

# Generate plot and save the plot as png

png(filename = "plot2.png", width = 480, height = 480, units = "px")


plot(plot_data$DateTime,plot_data$Global_active_power, xaxt="n", type = "l",
         xlab = "", ylab = "Global Active Power (kilowatts)")
     
axis.POSIXct( side = 1, at = plot_data$Date)

dev.off()


