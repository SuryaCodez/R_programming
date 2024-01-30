calculate_fine<-function(days_overdue){
  if(days_overdue<=7){
    fine<-0
  }else if(days_overdue<=30){
    fine<-(days_overdue-7)*2
  }else{
    fine<-50
  }
  return(fine)
}
days_overdue<-as.integer(readline("Enter the number of days the book is due to be submitted:\n"))
fine_amount<-calculate_fine(days_overdue)
cat("Fine amount:",fine_amount,"\n")
if(fine_amount==0){
  cat("No fine is required to be paid\n")
}else{
  if(days_overdue>30){
    cat("The amount of fine to be paid is",fine_amount)
  }else{
    cat("please pay the fine within the period")
  }
}
