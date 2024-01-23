library(rvest)
library(polite)

url <- "https://www.amazon.com/s?k=camera+photography&crid=NBD5VG1KTE0R&sprefix=camera+phot%2Caps%2C299&ref=nb_sb_ss_ts-doa-p_1_11"

session <- bow(url,
               user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59")
session_page <- scrape(session)

div_elements <- html_nodes(session_page, 'div.s-asin')

titles <- character()
prices <- character()
ratings <- character()
reviews <- character()

for (div_element in div_elements) {
  title_element <- html_node(div_element, 'span.a-text-normal')
  title <- ifelse(!is.na(title_element), html_text(title_element), '')
  
  price_element <- html_node(div_element, 'span.a-offscreen')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  reviews_element <- html_node(div_element, 'span.a-size-base')
  num_reviews <- ifelse(!is.na(reviews_element), html_text(reviews_element), '')
  
  titles <- c(titles, title)
  prices <- c(prices, price)
  ratings <- c(ratings, rating)
  reviews <- c(reviews, num_reviews)
}

product_df <- data.frame(Title = titles, 
                         Price = prices, 
                         Rating = ratings,
                         Num_Reviews = reviews)

write.csv(product_df, "product.csv")
