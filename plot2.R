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
png(filename = "plot2.png")
plot(df$Date, df$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()
