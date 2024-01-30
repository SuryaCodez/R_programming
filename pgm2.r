num_students <- 10
num_courses <- 5
student_names <- c("virat", "rohit", "pandya", "kl", "bumrah", "siraj", "jaddu", "dhoni", "iyer", "gill")
course_marks <- matrix(c(
  92, 98, 78, 96, 78, 
  67, 98, 94, 93, 100,
  87, 98, 09, 56, 38,
  100, 78, 76, 45, 99,
  87, 78, 97, 79, 60,
  59, 96, 99, 95, 88,
  67, 76, 78, 87, 89,
  98, 90, 91, 99, 89,
  100, 90, 99, 78, 73,
  19, 89, 92, 93, 94
), nrow = num_students, byrow = TRUE)
student_records<-list()
for(student_index in 1:num_students){
  student_name<-student_names[student_index]
  total_marks<-sum(course_marks[student_index,])
  average_marks<-total_marks/num_courses
  grade<-ifelse(average_marks>=90,'A',
                ifelse(average_marks>=80,'B',
                       ifelse(average_marks>=70,'C',
                              ifelse(average_marks<=69,'F'))))
  student_record<-list(
    name=student_name,
    marks=course_marks[student_index,],
    total=total_marks,
    average=average_marks,
    grade=grade
  )
  student_records<-c(student_records,list(student_record))
}
cat("\nSTUDENT REPORT CARD\n")
for(student_record in student_records){
  cat("\nNAME:",student_record$name,"\n")
  cat("\nMARKS:",student_record$marks,"\n")
  cat("\nTOTAL:",student_record$total,"\n")
  cat("\nAVERAGE:",student_record$average,"\n")
  cat("\nGRADE:",student_record$grade,"\n")
}

