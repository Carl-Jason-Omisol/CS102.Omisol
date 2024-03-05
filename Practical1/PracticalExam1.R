data(warpbreaks)
head(warpbreaks)
lines <- readLines("exampleFile.txt")
#A.Load the built-in Warpbreak

#1.Determine, using a single command, which columns of the 'warpbreak' dataset are composed of either numeric or integer values.
numeric_or_integer <- sapply(warpbreaks, function(x) is.numeric(x) || is.integer(x))
print(numeric_or_integer)

#2 is numeric in a single command which column 
warpbreaks$breaks <- as.integer(warpbreaks$breaks)
str(warpbreaks$breaks)

#3
sum_warpbreaks <- sum(warpbreaks)
#the error is in FUN(X[[i]], ...) 
#because The function is only defined on a data frame with all variables that resemble numeric data

#B
#1.Load the exampleFile.txt and then read the complete readlines.
textfile<-readLine("exampleFile.txt")

#2
line-from-txt <-c(
  "// Survey data. Created : 21 May 2013",
  "// Field 1: Gender",
  "// Field 2: Age (in years)",
  "// Field 3: Weight (in kg)",
  "M;28;81.3",
  "male;45;",
  "Female;17;57,2",
  "fem.;64;62.8",
)

identify_comments<-Linesfromtxt[grep1("^//",lines-from-txt)]
identify_data<-Linesfromtxt[!grep1("^//",lines-from-txt)]
print("comments")
print(identify_comments)

#3.Extract the date from the first comment
install.packages("lubridate")
library("lubridate")
