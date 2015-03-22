library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

data_baltimore_on_road<-NEI[NEI$fips == "24510" & NEI$type == 'ON-ROAD', ]
data_baltimore_on_road$year<-factor(data_baltimore_on_road$year, levels=c('1999', '2002', '2005', '2008'))
sum_baltimore_on_road<-aggregate(data_baltimore_on_road$Emissions~data_baltimore_on_road$year,data=data_baltimore_on_road,FUN=sum)
colnames(sum_baltimore_on_road)<-c('Year', 'Emissions')

png('plot5.png')
ggplot(data=sum_baltimore_on_road, aes(x=Year, y=Emissions)) + geom_bar(aes(fill=Year),stat="identity") + guides(fill=F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
dev.off()