hpc <- read.csv("~/Desktop/datasciencecoursera/Exploratory Data Analysis/Exploratory_Data_analysis/household_power_consumption.txt", 
                sep=";", na.strings="?")

library(dplyr)
library(lubridate)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- hpc %>% mutate(Date_Time=paste(Date, Time, sep = " "))

hpc$Date_Time <- ymd_hms(hpc$Date_Time)
hpc$Time <- hms(hpc$Time)

hpc2 <- hpc %>% 
    filter(between(Date, as.Date("2007-02-01"), 
                   as.Date("2007-02-02")))

png("plot2.png")

plot(hpc2$Date_Time, hpc2$Global_active_power, type = "l", 
     ylab = "Global Active Power (Kilowatts)", xlab = "")

dev.off()






