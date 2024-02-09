
install.packages("rvest")

library(rvest)
library(polite)

url <- "https://www.amazon.com/s?i=fashion-mens-intl-ship&bbn=16225019011&rh=n%3A7141123011%2Cn%3A16225019011%2Cn%3A7147441011%2Cn%3A1040658%2Cn%3A1045560&dc&ds=v1%3AElocxdOTcgPvyqUcczcF4Wx0Gy3bEJ19lREM0yrLZNc&qid=1707490821&rnid=7141123011&ref=sr_nr_n_8"

session <- bow(url, user_agent = "Educational")
session

session_page <- scrape(session)

div_elements <- html_nodes(session_page, 'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')

brand_descriptions <- character()
prices <- character()
review_counts <- character()
ratings <- character()

product_count <- 0

for (div_element in div_elements) {
  
  brand_element <- html_node(div_element, 'a-size-base-plus a-color-base a-text-normal')
  brand <- ifelse(!is.na(brand_element), html_text(brand_element), '')
  
  description_element <- html_node(div_element, 'div.a-section.a-spacing-small')
  description <- ifelse(!is.na(description_element), html_text(description_element), '')
  
  price_element <- html_node(div_element, 'span.a-price-whole')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  review_count_element <- html_node(div_element, 'span.a-size-base')
  review_count <- ifelse(!is.na(review_count_element), html_text(review_count_element), '')
  
  
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  brand_description <- paste(brand, description)
  brand_descriptions <- c(brand_descriptions, brand_description)
  prices <- c(prices, price)
  review_counts <- c(review_counts, review_count)
  ratings <- c(ratings, rating)
  
  
}

product_df3 <- data.frame(Brand_Description = brand_descriptions,
                          Price = prices,
                          Review_Count = review_counts,
                          Rating = ratings)

write.csv(product_df3, "ThirdItem.csv")

product_df3$Category <- "Shorts"

product_df3 <- product_df3[, c("Category", names(product_df3)[-which(names(product_df3) == "Category")])]

write.csv(product_df3, "Third_product.csv", row.names = FALSE)

View(Product3)