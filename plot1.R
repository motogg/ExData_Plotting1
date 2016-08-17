# Reading in the Data
df = read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

# Taking the subset that includes only 01/02/2007 - 02/02/2007
df = df[grep("^([12])/2/2007",df$Date),]

# Converts Global_active_power to Type numeric
df$Global_active_power = as.numeric(df$Global_active_power)

# histogram  code
png(filename = "plot1.png")
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")
dev.off()
