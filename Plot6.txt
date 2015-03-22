library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

data_baltimore_on_road<-NEI[NEI$fips == "24510" & NEI$type == 'ON-ROAD', ]
data_baltimore_on_road$year<-factor(data_baltimore_on_road$year, levels=c('1999', '2002', '2005', '2008'))
sum_baltimore_on_road<-aggregate(data_baltimore_on_road$Emissions~data_baltimore_on_road$year,data=data_baltimore_on_road,FUN=sum)
colnames(sum_baltimore_on_road)<-c('Year', 'Emissions')
sum_baltimore_on_road$City <- paste(rep('BT', 4))


data_la_on_road<-NEI[NEI$fips == "06037" & NEI$type == 'ON-ROAD', ]
data_la_on_road$year<-factor(data_la_on_road$year, levels=c('1999', '2002', '2005', '2008'))
sum_la_on_road<-aggregate(data_la_on_road$Emissions~data_la_on_road$year,data=data_la_on_road,FUN=sum)
colnames(sum_la_on_road)<-c('Year', 'Emissions')
sum_la_on_road$City <- paste(rep('LA', 4))

combined_data <- as.data.frame(rbind(sum_baltimore_on_road, sum_la_on_road))

png('plot6.png')
ggplot(data=combined_data, aes(x=Year, y=Emissions)) + geom_bar(aes(fill=Year),stat="identity") + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Los Angeles County, California vs. Baltimore City, Maryland') + 
 ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) +  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

dev.off()