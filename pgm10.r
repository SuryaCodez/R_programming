library(dplyr)
df<-data.frame(
  empid=c(101,102,103,104,105),
  name=c("john","linda","thomas","arthur","shelby"),
  age=c(23,45,27,29,32),
  salary=c(12000,14000,23400,15000,14800),
  department=c("hr","it","finance","sales","production")
)
filtered_data<-filter(df,age>25)
selected_columns<-select(df,empid,name,salary)
mutated_data<-mutate(df,salary_update=salary*1.1)
grouped_data<-group_by(df,department)
summarized_data<-summarise(grouped_data,avg_salary=mean(salary),max_age=max(age))
arranged_data<-arrange(df,age,desc(salary))
df2<-data.frame(
  empid=c(102,103,104),
  bonus=c(2000,3000,4000)
)
joined_data<-left_join(df,df2,by="empid")
print("filtered data:")
print(filtered_data)
print("selected columns:")
print(selected_columns)
print("mutated data:")
print(mutated_data)
print("summarized data:")
print(summarized_data)
print("arranged data:")
print(arranged_data)
print("joined data:")
print(joined_data)
