# plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data
btm <- filter(NEI, fips == "24510")
#group the data by year 
years <- group_by(btm, year)
q2 <- summarize(years, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using the base plotting system
with(data = q2, plot(year, total_pm25, main = "Trend of PM25 across 5 years in Baltimore", xlab = "year", ylab = "Total Emission of PM25", type = "b"))
#save the plot
dev.copy(png, file="plot2.png")
dev.off()