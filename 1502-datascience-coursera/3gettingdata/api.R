clientSecret <- "94681ea7f7a817921896ca4a70241707fda98e6f"
clientId <- "e6bd2bdc1bf60b5d215b"
url <- "https://api.github.com/users/jtleek/repos"
library(httr)
library(httpuv)
library(jsonlite)


myapp <- oauth_app("github", key=clientId, secret = clientSecret)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)

results <- GET(url, gtoken)
stop_for_status(results)
json <- content(results)
json2 <- jsonlite::fromJSON(toJSON(json))
names(json2)
json2[json2$name=="datasharing", c(1,2,3, 45)]
