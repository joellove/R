# Quiz 2.
# Problem 1.
install.packages('httpuv')
install.packages('jsonlite')
install.packages('httr')
library('httpuv')
library('jsonlite')
library('httr')

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("My application", "ec070735aa24a15c9fb5", "852a282fade63f44f056f89ba9e21466573b44d4")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)
# curl -u Access Token:x-oauth-basic "https://api.github.com/users/jtleek/repos"
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))
# 2013-11-07T13:25:07Z


# Problem 2.
install.packages('sqldf')
library(sqldf)
setwd("C:\\Users\\JL186064\\Documents\\GitHub\\R\\coursera\\getting&cleaningdata\\week2")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

if(!file.exists("data")){
    dir.create("data")
}

download.file(fileURL, destfile="./data/getdata-data-ss06pid.csv", mode="wb", method="internal")
acs <- read.csv("./data/getdata-data-ss06pid.csv", header=T, sep=",")
head(acs)
sqldf("select pwgtp1 from acs where AGEP < 50")


# Problem 3.
sqldf("select distinct AGEP from acs")
length(unique(acs$AGEP)) # 91

# Problem 4.
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
#<meta name="Distribution" content="Global" /> 
#    45 
#<script type="text/javascript"> 
#    31 
#})(); 
#7 
#\t\t\t\t<ul class="sidemenu"> 
#    25


# Problem 5.
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURL, destfile="./data/getdata-wksst8110.for", mode="wb", method="internal")
list.files()
data <- read.csv("./data/getdata-wksst8110.for", header=T)
head(data)
dim(data)
file_name <- "./data/getdata-wksst8110.for"
df <- read.fwf(file=file_name, widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])
# 32426.7






