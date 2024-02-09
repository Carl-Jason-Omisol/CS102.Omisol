
product1 <- read.csv("/cloud/project/Activity1/CSV files/First_product.csv")
product2 <- read.csv("/cloud/project/Activity1/CSV files/Second_product.csv")
product3 <- read.csv("/cloud/project/Activity1/CSV files/Third_product.csv")

merged_products <- rbind(product1, product2, product3)

write.csv(merged_products, "MergedProducts.csv", row.names = FALSE)
