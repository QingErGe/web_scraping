install.packages("rvest")
library(rvest)
#Specifying url of website to be scrapped
url <- 'https://en.wikipedia.org/wiki/List_of_countries_by_cigarette_consumption_per_capita'

#reading the html code
web_page <- read_html(url)

#quick look at the contents of web page
head(web_page)
str(web_page)

#Ranking
Ranking_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(1)')
Ranking <- html_text(Ranking_html)
Ranking <- Ranking[1:182]
Ranking

#country
country_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(2) > a')
country <- html_text(country_html)
country <- country[1:182]
country

No_of_ciggrettes_html <- html_nodes(web_page, 'tr:nth-child(n) > td:nth-child(3)')
No_of_ciggrettes <- html_text(No_of_ciggrettes_html)
No_of_ciggrettes <- No_of_ciggrettes[1:182]
No_of_ciggrettes

cigarette_consumption_per_capita <- data.frame(Ranking, country, No_of_ciggrettes)
cigarette_consumption_per_capita

write.csv(cigarette_consumption_per_capita, file = "cigarette_consumption_per_capita.csv", row.names = FALSE)
cigarette_consumption_Data <- read.csv('cigarette_consumption_per_capita.csv')
cigarette_consumption_Data