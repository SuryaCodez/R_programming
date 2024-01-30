library(forecast)
sales_data<-data.frame(
  Month=seq(as.Date("2023-01-01"),as.Date("2023-06-01"),by="months"),
  Sales=c(1200,1300,1450,1700,1800,2200)
)
sales_ts<-ts(sales_data$Sales,frequency = 12)
arima_model<-auto.arima(sales_ts)
print(forecast(arima_model,h=3))
plot(forecast(arima_model,h=3))
