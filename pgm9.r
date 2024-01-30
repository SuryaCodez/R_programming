library(ggplot2)
library(gridExtra)
set.seed(123)
num_students<-15
students<-data.frame(
  Name=paste("student",1:num_students),
  Scores=sample(60:100,num_students,replace=TRUE),
  Attendance=sample(60:100,num_students,replace=TRUE)
)
scatter_plot<-ggplot(students,aes(x=Scores,y=Attendance))+geom_point(color="red")+labs(title="scores vs attendance",x="scores",y="attendance")
bar_plot<-ggplot(students,aes(x=Name,y=Scores))+geom_bar(stat="identity",fill="orange")+theme(axis.text.x=element_text(angle=45,hjust=1))+labs(title="distibution of scores",x="name",y="scores")
students$Time<-seq_len(num_students)
line_plot<-ggplot(students,aes(x=Time,y=Scores,group=1))+geom_line(color="purple")+labs(title="trend of scores over time",x="time",y="scores")
histogram_plot<-ggplot(students,aes(x=Scores))+geom_histogram(binwidth=10,position="identity",color="brown")+scale_fill_brewer(palette="Set3")+labs(title="distribution of scores",x="scores",y="frequency")
print(histogram_plot)
grid.arrange(scatter_plot,bar_plot,line_plot,histogram_plot,ncol=2)
