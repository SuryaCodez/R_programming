library(ggplot2)
library(reshape2)
matrix_A<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3,byrow=TRUE)
matrix_B<-matrix(c(9,8,7,6,5,4,3,2,1),nrow=3,ncol=3,byrow=TRUE)
sum_matrix<-matrix_A+matrix_B
scaled_matrix<-matrix_A*2
transposed_matrix_A<-t(matrix_A)
transposed_matrix_B<-t(matrix_B)
product_matrix<-matrix_A %*% matrix_B
sum_matrix_A<-sum(matrix_A)
mean_matrix_B<-mean(matrix_B)
sd_matrix_B<-sd(matrix_B)
heatmap_data<-melt(matrix_A)
heatmap_plot<-ggplot(heatmap_data,aes(x=Var1,y=Var2,fill=value))+geom_tile()+scale_fill_gradient(low="white",high="blue")+labs(title="heatmap of matrix A",x="column",y="row")
row_sums<-rowSums(matrix_B)
row_names<-paste("row",1:3)
barplot_data<-data.frame(
  Row=row_names,
  Sum=row_sums
  )
barplot_plot<-ggplot(barplot_data,aes(x="Row",y="Sum"))+geom_bar(stat="identity",fill="green")+labs(title="row sum of matrix B",x="Row",y="Sum")
print(heatmap_plot)
print(barplot_plot)
cat("sum of matrices",sum_matrix)
cat("scaled matrix",scaled_matrix)
cat("transpose matrix of A",transposed_matrix_A)
cat("transpose matrix of B",transposed_matrix_B)
cat("product matrix",product_matrix)
