library("assertthat", lib.loc="~/R/win-library/3.2")
library("BH", lib.loc="~/R/win-library/3.2")
library("bitops", lib.loc="~/R/win-library/3.2")
library("curl", lib.loc="~/R/win-library/3.2")
library("DBI", lib.loc="~/R/win-library/3.2")
library("dplyr", lib.loc="~/R/win-library/3.2")
library("htmltab", lib.loc="~/R/win-library/3.2")
library("httr", lib.loc="~/R/win-library/3.2")
library("jsonlite", lib.loc="~/R/win-library/3.2")
library("lazyeval", lib.loc="~/R/win-library/3.2")
library("magrittr", lib.loc="~/R/win-library/3.2")
library("mime", lib.loc="~/R/win-library/3.2")
library("NLP", lib.loc="~/R/win-library/3.2")
library("openssl", lib.loc="~/R/win-library/3.2")
library("plyr", lib.loc="~/R/win-library/3.2")
library("R6", lib.loc="~/R/win-library/3.2")
library("Rcpp", lib.loc="~/R/win-library/3.2")
library("RCurl", lib.loc="~/R/win-library/3.2")
library("slam", lib.loc="~/R/win-library/3.2")
library("stringi", lib.loc="~/R/win-library/3.2")
library("stringr", lib.loc="~/R/win-library/3.2")
library("tidyr", lib.loc="~/R/win-library/3.2")
library("tm", lib.loc="~/R/win-library/3.2")
library("XML", lib.loc="~/R/win-library/3.2")
library("boot", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("class", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("cluster", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("codetools", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("compiler", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("datasets", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("foreign", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("graphics", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("grid", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("KernSmooth", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("lattice", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("MASS", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("Matrix", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("methods", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("mgcv", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("nnet", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("parallel", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("rpart", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("spatial", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("splines", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("stats", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("stats4", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("survival", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("tcltk", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("tools", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("translations", lib.loc="C:/Program Files/R/R-3.2.4revised/library")
library("utils", lib.loc="C:/Program Files/R/R-3.2.4revised/library")

# process the Filling File of 2015 Costco

url2015 <- "https://www.sec.gov/Archives/edgar/data/909832/000090983215000019/costproxy2015.htm"
htmltab(doc = url2015, which=59)
urldata2015 <- GET(url2015)
data2015 <- readHTMLTable(rawToChar(urldata2015$content), stringsAsFactors = FALSE)
data2015 [[59]]
compensation.table.data2015 <- data2015 [[59]]
compensation.table.data2015
compensation.table2015<- compensation.table.data2015 [3:4, c("V1","V3", "V5", "V7","V9","V13")]
compensation.table2015
compensation.table2015 <-rename(compensation.table2015, c("V1"="Name and Principal Position", "V3"="Year", "V5"="Salary", "V7"="Bonus", "V9"="Stock_Awards", "V13"="All_Other_Compensation"))

# process the Filling File of 2014 Costco

url2014 <- "https://www.sec.gov/Archives/edgar/data/909832/000090983214000028/costdefproxy2014.htm"
htmltab(doc = url2014, which=56)
urldata2014 <- GET(url2014)
data2014 <- readHTMLTable(rawToChar(urldata2014$content), stringsAsFactors = FALSE)
data2014[[56]]
compensation.table.data2014 <- data2014 [[56]]
compensation.table.data2014
compensation.table2014<- compensation.table.data2014[4:4, c("V1","V3", "V5", "V7","V9","V13")]
compensation.table2014
compensation.table2014 <- rename(compensation.table2014, c("V1"="Name and Principal Position", "V3"="Year", "V5"="Salary", "V7"="Bonus", "V9"="Stock_Awards", "V13"="All_Other_Compensation"))
compensation.table2014
write.csv(compensation.table2015, file = " compensation.table2015.csv")

# merge the data of 2014 and 2015 compensation.table 
compensation.table <- rbind(compensation.table2015, compensation.table2014)

# process the Filling File of 2013 Costco, part one

url2013 <- "https://www.sec.gov/Archives/edgar/data/909832/000090983213000007/costdefproxy2013.htm"
htmltab(doc = url2013, which=59)
urldata2013 <- GET(url2013)
data2013 <- readHTMLTable(rawToChar(urldata2013$content), stringsAsFactors = FALSE)
data2013[[59]]
compensation.table.data2013 <- data2013 [[59]]
compensation.table.data2013
compensation.table2013<- compensation.table.data2013[4:4, c("V1","V3", "V5", "V7","V9","V13")]
compensation.table2013
compensation.table2013 <- rename(compensation.table2013, c("V1"="Name and Principal Position", "V3"="Year", "V5"="Salary", "V7"="Bonus", "V9"="Stock_Awards", "V13"="All_Other_Compensation"))
compensation.table2013

# merge the data 
compensation.table <- rbind(compensation.table, compensation.table2013)

# process the Filling File of 2013 Costco, part two

compensation.table2013_2<- compensation.table.data2013[5:5, c("V1","V2", "V4", "V6","V8","V12")]
compensation.table2013_2 <- rename(compensation.table2013_2, c("V1"="Name and Principal Position", "V2"="Year", "V4"="Salary", "V6"="Bonus", "V8"="Stock_Awards", "V12"="All_Other_Compensation"))
compensation.table2013_2

# merge the data 
compensation.table <- rbind(compensation.table, compensation.table2013_2)

# write the file 
write.csv(compensation.table, file = " compensation.table.csv")

# process the Filling File of 2010 Costco
url2010 <- "https://www.sec.gov/Archives/edgar/data/909832/000119312510279341/ddef14a.htm"
htmltab(doc = url2010, which=56)
urldata2010 <- GET(url2010)
data2010 <- readHTMLTable(rawToChar(urldata2010$content), stringsAsFactors = FALSE)
data2010[[56]]
compensation.table.data2010 <- data2010 [[56]]
compensation.table.data2010
names(compensation.table.data2010)[1]<-paste("V1")
names(compensation.table.data2010)[2]<-paste("V2")
names(compensation.table.data2010)[3]<-paste("V3")
names(compensation.table.data2010)[4]<-paste("V4")
names(compensation.table.data2010)[5]<-paste("V5")
names(compensation.table.data2010)[6]<-paste("V6")
names(compensation.table.data2010)[7]<-paste("V7")
names(compensation.table.data2010)[8]<-paste("V8")
names(compensation.table.data2010)[9]<-paste("V9")
names(compensation.table.data2010)[10]<-paste("V10")
names(compensation.table.data2010)[11]<-paste("V11")
names(compensation.table.data2010)[12]<-paste("V12")
names(compensation.table.data2010)[13]<-paste("V13")
names(compensation.table.data2010)[14]<-paste("V14")
names(compensation.table.data2010)[15]<-paste("V15")
names(compensation.table.data2010)[16]<-paste("V16")
names(compensation.table.data2010)[17]<-paste("V17")
names(compensation.table.data2010)[18]<-paste("V18")
names(compensation.table.data2010)[19]<-paste("V19")
names(compensation.table.data2010)[20]<-paste("V20")
names(compensation.table.data2010)[21]<-paste("V21")
names(compensation.table.data2010)[22]<-paste("V22")
names(compensation.table.data2010)[23]<-paste("V23")
names(compensation.table.data2010)[24]<-paste("V24")
names(compensation.table.data2010)[25]<-paste("V25")
names(compensation.table.data2010)[26]<-paste("V26")
names(compensation.table.data2010)[27]<-paste("V27")
names(compensation.table.data2010)[28]<-paste("V28")
names(compensation.table.data2010)[29]<-paste("V29")
compensation.table2010 <- compensation.table.data2010[2:4, c("V1","V4","V8", "V12", "V16","V24")]
names(compensation.table2010)[1]<-paste("Name and Principal Position")
names(compensation.table2010)[2]<-paste("Year")
names(compensation.table2010)[3]<-paste("Salary")
names(compensation.table2010)[4]<-paste("Bonus")
names(compensation.table2010)[5]<-paste("Stock_Awards ")
names(compensation.table2010)[6]<-paste("All_Other_Compensation")
compensation.table2010
# write the file 
write.csv(compensation.table2010, file = " compensation.table2010.csv")

# process the Filling File of 2007 Costco
url2007 <- "https://www.sec.gov/archives/edgar/data/909832/000119312507266767/ddef14a.htm"
htmltab(doc = url2007, which=56)
urldata2007 <- GET(url2007)
data2007 <- readHTMLTable(rawToChar(urldata2007$content), stringsAsFactors = FALSE)
data2007[[56]]
compensation.table.data2007 <- data2007 [[56]]
compensation.table.data2007
names(compensation.table.data2007)[1]<-paste("V1")
names(compensation.table.data2007)[2]<-paste("V2")
names(compensation.table.data2007)[3]<-paste("V3")
names(compensation.table.data2007)[4]<-paste("V4")
names(compensation.table.data2007)[5]<-paste("V5")
names(compensation.table.data2007)[6]<-paste("V6")
names(compensation.table.data2007)[7]<-paste("V7")
names(compensation.table.data2007)[8]<-paste("V8")
names(compensation.table.data2007)[9]<-paste("V9")
names(compensation.table.data2007)[10]<-paste("V10")
names(compensation.table.data2007)[11]<-paste("V11")
names(compensation.table.data2007)[12]<-paste("V12")
names(compensation.table.data2007)[13]<-paste("V13")
names(compensation.table.data2007)[14]<-paste("V14")
names(compensation.table.data2007)[15]<-paste("V15")
compensation.table2007 <- compensation.table.data2007[2:2, c("V1","V3","V5", "V7", "V11","V13","V15")]
compensation.table2007
# write the file 
write.csv(compensation.table2007, file = "compensation.table2007.csv")

# process the Filling File of 2006 Costco
url2006 <- "https://www.sec.gov/Archives/edgar/data/909832/000119312506256505/ddef14a.htm"
htmltab(doc = url2006, which=48)
urldata2006 <- GET(url2006)
data2006 <- readHTMLTable(rawToChar(urldata2006$content), stringsAsFactors = FALSE)
data2006[[48]]
compensation.table.data2006 <- data2006 [[48]]
compensation.table.data2006
names(compensation.table.data2006)[1]<-paste("V1")
names(compensation.table.data2006)[2]<-paste("V2")
names(compensation.table.data2006)[3]<-paste("V3")
names(compensation.table.data2006)[4]<-paste("V4")
names(compensation.table.data2006)[5]<-paste("V5")
names(compensation.table.data2006)[6]<-paste("V6")
names(compensation.table.data2006)[7]<-paste("V7")
names(compensation.table.data2006)[8]<-paste("V8")
names(compensation.table.data2006)[9]<-paste("V9")
names(compensation.table.data2006)[10]<-paste("V10")
names(compensation.table.data2006)[11]<-paste("V11")
names(compensation.table.data2006)[12]<-paste("V12")
names(compensation.table.data2006)[13]<-paste("V13")
names(compensation.table.data2006)[14]<-paste("V14")
names(compensation.table.data2006)[15]<-paste("V15")
compensation.table2006 <- compensation.table.data2006[3:3, c("V1","V3","V5", "V7", "V11","V13","V15")]
names(compensation.table2006)[1]<-paste("Name and Principal Position")
names(compensation.table2006)[2]<-paste("Year")
names(compensation.table2006)[3]<-paste("Salary")
names(compensation.table2006)[4]<-paste("Bonus")
names(compensation.table2006)[5]<-paste("Option_Awards")
names(compensation.table2006)[6]<-paste("Stock_Awards")
names(compensation.table2006)[7]<-paste("All_Other_Compensation")
compensation.table2006
# write the file 
write.csv(compensation.table2006, file = " compensation.table2006.csv")

# process the Filling File of 2003 Costco
url2003 <- "https://www.sec.gov/Archives/edgar/data/909832/000119312503096388/ddef14a.htm"
htmltab(doc = url2003, which=44)
urldata2003 <- GET(url2003)
data2003 <- readHTMLTable(rawToChar(urldata2003$content), stringsAsFactors = FALSE)
data2003[[44]]
compensation.table.data2003 <- data2003 [[44]]
compensation.table.data2003
names(compensation.table.data2003)[1]<-paste("V1")
compensation.table2003<- compensation.table.data2003[2:4, c("Name and Principal Position","V3", "V5", "V7","V11","V13")]
compensation.table2003
names(compensation.table2003)[1]<-paste("Name and Principal Position ")
names(compensation.table2003)[2]<-paste("Year")
names(compensation.table2003)[3]<-paste("Salary")
names(compensation.table2003)[4]<-paste("Bonus")
names(compensation.table2003)[5]<-paste("Option_Awards")
names(compensation.table2003)[6]<-paste("All_Other_Compensation")
compensation.table2003
write.csv(compensation.table2003, file = " compensation.table2003.csv")

# process the Filling File of 1999 Costco
costco1999 <- read.delim("~/R/costco1999.txt", comment.char="#")
View(costco1999)
costco1999.1 <- costco1999[547:575,]
costco1999.1
write.csv(costco1999.1, file = "costco1999.1.csv")

# process the Filling File of 1996 Costco
costco1996 <- read.delim("~/R/costco1996.txt", comment.char="#")
View(costco1996)
costco1996.1 <- costco1996[645:671,]
costco1996.1
write.csv(costco1996.1, file = "costco1996.1.csv")

# process the Filling File of 1994 Costco
costco1994 <- read.delim("~/R/costco1994.txt", comment.char="#")
View(costco1994)
costco1994.1 <- costco1994[677:702,]
costco1994.1
write.csv(costco1994.1, file = "costco1994.1.csv")


