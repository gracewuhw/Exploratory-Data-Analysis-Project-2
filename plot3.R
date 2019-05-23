# plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data
btm <- filter(NEI, fips == "24510")
#group the data from type, year
typeyear <- group_by(btm, type, year)
q3 <- summarize(typeyear, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using ggplot2
g <- ggplot(q3, aes(year, total_pm25))
g + geom_line(aes(color = type), size = 1) + labs(y = "Total Emissions of PM25") + labs(title = "PM25 level from 4 sources through 5 years in Baltimore")
#save the plot
dev.copy(png, file="plot3.png")
dev.off()