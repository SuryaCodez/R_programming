library(dplyr)
student_data<-data.frame(
  Name=character(0),
  Math_score=numeric(0),
  Science_score=numeric(0),
  History_score=numeric(0),
  Attendance=numeric(0)
)
add_student<-function(name,math_score,science_score,history_score,attendance){
  new_student<-data.frame(
    Name=name,
    Math_score=math_score,
    Science_score=science_score,
    History_score=history_score,
    Attendance=attendance
    )
  student_data<<-bind_rows(student_data,new_student)
  cat("The student information is added successfully\n")
}
calc_avg_scores<-function(){
  avg_scores<-student_data %>% mutate(Average_score=(Math_score+Science_score+History_score)/3) %>% select(Name,Average_score)
  return(avg_scores)
}
identify_low_attendance<-function(threshold){
  low_attendance<-student_data %>% filter(Attendance<threshold) %>% select(Name,Attendance)
  return(low_attendance)
}
generate_report<-function(){
  avg_scores<-calc_avg_scores()
  low_attendance<-identify_low_attendance(60)
  report<-merge(avg_scores,low_attendance,by="Name",all=TRUE)
  report$Attendance[is.na(report$Attendance)]<-85
  cat("Performance report:\n")
  print(report)
}
while(TRUE){
  cat("1.Add student\n2.Generate Report\n3.exit")
  choice<-as.integer(readline("enter your choice"))
  if(choice==1){
    name=readline("enter name of the student:\n")
    math_score=as.integer(readline("enter math score:\n"))
    science_score=as.integer(readline("enter science score:\n"))
    history_score=as.integer(readline("enter history score:\n"))
    attendance=as.integer(readline("enter attendance:\n"))
    add_student(name,math_score,science_score,history_score,attendance)
  }else if(choice==2){
    generate_report()
  }else if(choice==3){
    cat("goodbye!")
    break
  }else{
    cat("invalid choice enter again")
  }
}
  
