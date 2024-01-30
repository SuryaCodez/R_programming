inventory_items<-character(0)
inventory_quantities<-numeric(0)
add_item<-function(item,quantity){
  inventory_items<<-c(inventory_items,item)
  inventory_quantities<<-c(inventory_quantities,quantity)
  cat("item added to the inventory successfully\n")
}
update_quantity<-function(item,new_quantity){
  if(item %in% inventory_items){
    item_index<-which(inventory_items==item)
    inventory_quantities[item_index]<<-new_quantity
    cat("quantity of item updated successfully\n")
  }else{
    cat("item not found in inventory\n")
  }
}
display_inventory<-function(){
  cat("\nInventory Items\n")
  for(i in 1:length(inventory_items)){
    cat(sprintf("%s:%d\n",inventory_items[i],inventory_quantities[i]))
  }
}
while(TRUE){
  cat("\n1.add\n2.update\n3.display\n4.exit\n")
  choice<-as.integer(readline("enter your choice:\n"))
  if(choice==1){
    item<-readline("enter item name:")
    quantity<-as.integer(readline("enter the quantity of item:"))
    add_item(item,quantity)
  }else if(choice==2){
    item<-readline("enter the item name:")
    new_quantity<-as.integer(readline("enter the new quantity of item:"))
    update_quantity(item,new_quantity)
  }else if(choice==3){
    display_inventory()
  }else if(choice==4){
    cat("good bye!\n")
  }else{
    cat("invalid choice enter again:\n")
  }
  
}
