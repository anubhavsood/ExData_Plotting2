library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")


scc_for_coal<-SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE),]
merge <- merge(x=NEI, y=scc_for_coal, by="SCC" )
for_coal<-aggregate(NEI$Emissions~NEI$year,data=NEI,FUN=sum)
colnames(for_coal)<-c('Year', 'Emissions')

png('plot4.png')
ggplot(data=for_coal,aes(x=Year,y=Emissions/1000)) + geom_line(aes(col=Emissions)) + geom_point(aes(col=Emissions)) +  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5))+ggtitle(expression('Total Emissions of PM'[2.5])) +ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + xlab('Year')
dev.off()