setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\toto")
#install.packages(XML)
library("XML")
library("RCurl")
library(httr)

#addr <- "https://www2.pinnaclesports.com/Sportsbook/Asia/ko-KR/Bet/Soccer/Today/Double/null/null/Asian/SportsbookAsia/Decimal/85/#tab=Menu&sport=/Sportsbook/Asia/ko-KR/GetLines/Soccer/Today/1/null/null/Asian/SportsbookAsia/Decimal/85/false/&wager=/Sportsbook/BetList/GetMini/6__customerId--KR812CCD37&ticket=/Sportsbook/BetList/GetMini/7__customerId--KR812CCD37&line=/Sportsbook/Bet/Add/398491724/0/1/1/0/10.33__line--"
#html <- GET(addr)
#url <- getURL(addr, ssl.verifypeer = FALSE)

#POST("https://www.pin1111.com/",
#     body= list(RURL="https://www.pin1111.com/",
#                user="kr812ccd37", password="tkdhwjd01"),
#     user_agent("Mozilla/5.0"))

POST("http://gu8253.com/login.php",
     body= list(RURL="http://gu8253.com/game/game_list.php?sch_gtype1=Full&sch_gtype2=WDL",
                user="rokafcq", password="tkdhwjd01"),
     user_agent("Mozilla/5.0"))

curl <- getCurlHandle()
curlSetOpt(cookiejar="/tmp/cookies.txt", curl=curl)
postForm("http://gu8253.com/game/game_list.php?sch_gtype1=Full&sch_gtype2=WDL", login="rokafq", passwd="tkdhwjd01", curl=curl)
getURL("", curl=curl)

#웹에서 직접 크롤링은 인증때문에 방법을 아직 찾지못함. html파일을 다운받아 진행


pinnacleURL <- "./data/pinnacle.htm"
pinnacleHtml <- htmlParse(pinnacleURL)

zzangguURL <- "./data/짱구.htm"
zzangguHtml <- htmlParse(zzangguURL)


#doc <- xmlTreeParse(fileURL, useInternal=TRUE)
#rootNode <- xmlRoot(doc)
#xmlName(rootNode)
#names(rootNode)
#rootNode[[1]]
#rootNode[[1]][[1]]

#xmlSApply(rootNode, xmlValue)
#zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)

#length(zipcode[zipcode==21231])




