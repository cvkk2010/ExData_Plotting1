
# Read Data from Text file

da = read.table("household_power_consumption.txt", sep = ";", header = T,
                as.is = T)

# Convert Date Column from Char to Date

da$Date = as.Date(da$Date, "%d/%m/%Y")

# Subsetting Data between "2007-02-01" and "2007-02-02"

plot_data = subset(da, Date >= "2007-02-01" & Date <= "2007-02-02")


# Generate Histogram plot and save the plot as png

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(as.numeric(plot_data$Global_active_power), 
                xlab = "Global Active Power (kilowatts)", col = "red",
                main = "Global Active Power")

dev.off()


