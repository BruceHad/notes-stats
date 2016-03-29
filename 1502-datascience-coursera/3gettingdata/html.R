library(httr)
library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- readLines(url)
nchar(html[10])
nchar(html[20])
nchar(html[30])
nchar(html[100])