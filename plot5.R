# plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#retrieve the data from motor vehicle sources in SCC dataset
motorvehicle <- SCC[grep("Veh", SCC$Short.Name), ]
#subset the data in NEI dataset
btmveh <- filter(NEI, SCC %in% motorvehicle$SCC & fips == "24510")
#group the data by year 
years <- group_by(btmveh, year)
q5 <- summarize(years, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using the base plotting system
with(data = q5, plot(year, total_pm25, main = "Trend of PM25 from motor vehicle sources in Baltimore", xlab = "year", ylab = "Total Emission of PM25", type = "b"))
#save the plot
dev.copy(png, file="plot5.png")
dev.off()
