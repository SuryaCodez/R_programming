products<-list(
    list(name="apple",price=120),
    list(name="banana",price=35),
    list(name="milk",price=25),
    list(name="bread",price=50),
    list(name="egg",price=10)
)
shopping_cart<-list()
cart_items_to_add<-list(
    list(name="apple",quantity=3),
    list(name="milk",quantity=2)
)
for(item in cart_items_to_add){
    product_name<-item$name
    quantity<-item$quantity
}
product<-NULL
for(p in products){
    if(p$name==product_name){
        product <- p
        break
    }
}
if(!is.null(product)){
    cart_item<-list(name=product$name,price=product$price,quantity=quantity)
    shopping_cart<-c(shopping_cart,list(cart_item))
    cat("item added to cart\n")
    }else{
        cat("item not found in our stock\n")
}
subtotal<-0
cat("\nreceipt:\n")
for(item in shopping_cart){
    item_subtotal<-item$price*item$quantity
    cat(sprintf("%s(%d units)-Price:$%.2f-Subtotal:$%.2f\n",item$name,item$quantity,item$price,item_subtotal))
    subtotal<-subtotal+item_subtotal
}
tax_rate<-0.08
tax_amount<-subtotal*tax_rate
total_cost_before_tax<-subtotal
total_cost<-total_cost_before_tax+tax_amount
cat("\nsubtotal:$%.2f\n",subtotal)
cat("tax amount (8%):$%.2f\n",tax_amount)
cat("total cost:$%.2f\n",total_cost)
