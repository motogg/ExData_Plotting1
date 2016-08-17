# Reading in the Data
df = read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

# Taking the subset that includes only 01/02/2007 - 02/02/2007
df = df[grep("^([12])/2/2007",df$Date),]


# Merges Date with Time and Converts resulting  Date variable to the Type Date
df$Date = paste(df$Date, df$Time)
df$Date = strptime(df$Date, "%d/%m/%Y %H:%M:%S")

# Converts Global_active_power to Type numeric
df$Global_active_power = as.numeric(df$Global_active_power)

# line chart code
png(filename = "plot3.png")
with(df, {plot(Date, Sub_metering_1, ylab = "Energy Submetering", type = "n")
        lines(Date, Sub_metering_1, type = "l", col = "black")
        lines(Date, Sub_metering_2, type = "l", col = "red")
        lines(Date, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1 , lwd = 2 ,col = c("black","red","blue"),
               legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))})
dev.off()
