# plot 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#retrieve the data from motor vehicle sources in SCC dataset
motorvehicle <- SCC[grep("Veh", SCC$Short.Name), ]
#subset the data in NEI dataset (SCC --> motor vehicle sources; City --> Baltimore / California)
veh <- filter(NEI, SCC %in% motorvehicle$SCC & fips == "24510" | fips=="06037")
veh$fips <-as.factor(veh$fips)
#group the data by year 
years <- group_by(veh, year, fips)
q6 <- summarize(years, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using the base plotting system
g <- ggplot(q6, aes(year, total_pm25))
g + 
geom_line(aes(color = fips), size = 1) + 
labs(y = "Total Emissions of PM25") + 
labs(title = "PM25 level from motor vehicle sources through 5 years in Baltimore and Los Angeles") + 
scale_color_discrete(name  ="City", breaks=c("06037", "24510"), labels=c("California", "Baltimore"))
#save the plot
dev.copy(png, file="plot6.png")
dev.off()