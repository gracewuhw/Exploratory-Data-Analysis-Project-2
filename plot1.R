# plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#take a first glance of the data
head(NEI)
head(SCC)
#group the data by year                              
years <- group_by(NEI, year)
q1 <- summarize(years, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using the base plotting system
with(data = q1, plot(year, total_pm25, main = "Trend of PM25 across 5 years", xlab = "year", ylab = "Total Emission of PM25"))
#save the plot
dev.copy(png, file="plot1.png")
dev.off()
