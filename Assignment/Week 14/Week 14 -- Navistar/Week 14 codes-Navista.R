# save Navistar htm files
Navistarurl2015 <- "~/R/Navistar2015.htm"
Navistarurl2014 <- "~/R/Navistar2014.htm"
Navistarurl2013 <- "~/R/Navistar2013.htm"
Navistarurl2012 <- "~/R/Navistar2012.htm"
Navistarurl2011 <- "~/R/Navistar2011.htm"
Navistarurl2010 <- "~/R/Navistar2010.htm"
Navistarurl2009 <- "~/R/Navistar2009.htm"
Navistarurl2008 <- "~/R/Navistar2008.htm"

# save the cursors for start qa section and end qa section
qa_sentence_start <- "FREQUENTLY ASKED QUESTIONS REGARDING ATTENDANCE AND VOTING"
qa_sentence_end <- "in an amendment to the Form 8-K as soon as they become available."

# process 2015 file
# read the data from the file
dataNavistar2015 = readLines(Navistarurl2015)
# find the start and end section
grep(qa_sentence_start,dataNavistar2015, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2015, ignore.case = TRUE)
# show the content of qa section
dataNavistar2015[5882:7628]
# save the qa section 
qa_sectionNavistar2015 <- dataNavistar2015[5882:7628]
# save the data into a new text file 
cat(qa_sectionNavistar2015, file="~/R/qa_section/Navistar2015.txt", sep="n", append = TRUE)

# process 2014 file
# read the data from the file
dataNavistar2014 = readLines(Navistarurl2014)
# find the start and end section
grep(qa_sentence_start,dataNavistar2014, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2014, ignore.case = TRUE)
# show the content of qa section
dataNavistar2014[2796:3714]
# save the qa section 
qa_sectionNavistar2014 <- dataNavistar2014[2796:3714]
# save the data into a new text file 
cat(qa_sectionNavistar2014, file="~/R/qa_section/Navistar2014.txt", sep="n", append = TRUE)

# process 2013 file
# read the data from the file
dataNavistar2013 = readLines(Navistarurl2013)
# find the start and end section
grep(qa_sentence_start,dataNavistar2013, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2013, ignore.case = TRUE)
# show the content of qa section
dataNavistar2013[2795:3635]
# save the qa section 
qa_sectionNavistar2013 <- dataNavistar2013[2795:3635]
# save the data into a new text file 
cat(qa_sectionNavistar2013, file="~/R/qa_section/Navistar2013.txt", sep="n", append = TRUE)

# process 2012 file
# read the data from the file
dataNavistar2012 = readLines(Navistarurl2012)
# find the start and end section
grep(qa_sentence_start,dataNavistar2012, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2012, ignore.case = TRUE)
# show the content of qa section
dataNavistar2012[751:978]
# save the qa section 
qa_sectionNavistar2012 <- dataNavistar2012[751:978]
# save the data into a new text file 
cat(qa_sectionNavistar2012, file="~/R/qa_section/Navistar2012.txt", sep="n", append = TRUE)

# process 2011 file
# read the data from the file
dataNavistar2011 = readLines(Navistarurl2011)
# find the start and end section
grep(qa_sentence_start,dataNavistar2011, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2011, ignore.case = TRUE)
# show the content of qa section
dataNavistar2011[592:914]
# save the qa section 
qa_sectionNavistar2011 <- dataNavistar2011[592:914]
# save the data into a new text file 
cat(qa_sectionNavistar2011, file="~/R/qa_section/Navistar2011.txt", sep="n", append = TRUE)

# process 2010 file
# read the data from the file
dataNavistar2010 = readLines(Navistarurl2010)
# find the start and end section
grep(qa_sentence_start,dataNavistar2010, ignore.case = TRUE)
grep(qa_sentence_end,dataNavistar2010, ignore.case = TRUE)
# show the content of qa section
dataNavistar2010[583:937]
# save the qa section 
qa_sectionNavistar2010 <- dataNavistar2010[583:937]
# save the data into a new text file 
cat(qa_sectionNavistar2010, file="~/R/qa_section/Navistar2010.txt", sep="n", append = TRUE)

# process 2009 file
# read the data from the file
dataNavistar2009 = readLines(Navistarurl2009)
# find the start and end section
grep(qa_sentence_start,dataNavistar2009, ignore.case = TRUE)
grep("Stockholders may speak a second time only after all other stockholders who wish to speak have had their turn",dataNavistar2009, ignore.case = TRUE)
# show the content of qa section
dataNavistar2009[497:739]
# save the qa section 
qa_sectionNavistar2009 <- dataNavistar2009[497:739]
# save the data into a new text file 
cat(qa_sectionNavistar2009, file="~/R/qa_section/Navistar2009.txt", sep="n", append = TRUE)

# process 2008 file
# read the data from the file
dataNavistar2008 = readLines(Navistarurl2008)
# find the start and end section
grep(qa_sentence_start,dataNavistar2008, ignore.case = TRUE)
grep("Stockholders may speak a second time only after all other stockholders who wish to speak have had their turn",dataNavistar2008, ignore.case = TRUE)
# show the content of qa section
dataNavistar2008[284:610]
# save the qa section 
qa_sectionNavistar2008 <- dataNavistar2008[284:610]
# save the data into a new text file 
cat(qa_sectionNavistar2008, file="~/R/qa_section/Navistar2008.txt", sep="n", append = TRUE)

# save the directory for corpus
cname <- "~/R/qa_section"

library(tm)
library(NLP)
# save the corpus
qa_sections <- Corpus(DirSource(cname))

# show details for the corpus
inspect(qa_sections[1])
dir(cname)
summary(qa_sections)

library(magrittr)
# view the file
viewDocs <- function(d,n) {d %>% extract2(n) %>% as.character() %>% writeLines()}
viewDocs(qa_sections, 1)

# convert to lower case
qa_sections <- tm_map(qa_sections, content_transformer(tolower))

# remove numbers
qa_sections <- tm_map(qa_sections, removeNumbers)

# remove stop words
qa_sections <- tm_map(qa_sections, removeWords, stopwords("english"))

# Replacing certin expressions with spaces:
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ",x))
qa_sections <- tm_map(qa_sections, toSpace, "/|<|>|”|=|@|\\|:|;|-|\"")

# Remove Punctuations
qa_sections <- tm_map(qa_sections, removePunctuation)

# Strip white spaces:
qa_sections <- tm_map(qa_sections, stripWhitespace)

# Remove known often words:
qa_sections <- tm_map(qa_sections, removeWords, c("right","color","inherit","vertical","decoration","background","b", "br", "q", "a", "i", "e", "div", "style","n","trim","size","font", "can", "also", "e", "mail", "via", "td", "align","border", "familytimes", "roman", "p", "tr", "nbsp", "with", "table", "cellspacing", "valign", "cellpadding", "width", "top", "left", "sizepx", "telephone", "if", "may", "help", "us", "will", "please", "unless", "visit", "thnbsp","toppx","bottompx", "nnn", "address", "nonbsp", "new", "bottom", "em"))

# Specific Transformation:
toString <- content_transformer(function(x, from, to) gsub(from, to, x))
qa_sections <- tm_map(qa_sections, toString, "broker bank", "bb")

# Stemming:
install.packages("SnowballC")
library(SnowballC)

qa_sections <-tm_map(qa_sections, stemDocument)

# create a term document matrix
qa_sections <-tm_map(qa_sections, PlainTextDocument)
qa_dtm <- DocumentTermMatrix(qa_sections)
qa_dtm

# inpect the term document matrix
inspect(qa_dtm[1:8, 100:105])
freq <- colSums((as.matrix(qa_dtm)))
length(freq)
ord <- order(freq)
freq[head(ord)]
freq[tail(ord)]
head(table(freq), 15)
tail(table(freq), 15)

# convert to matrix and save it to CSV
m<-as.matrix(qa_dtm)
dim(m)
write.csv(m,file= "~/R/qa_Navistar.csv")

# remove sparse terms
dtms <- removeSparseTerms(qa_dtm, 0.1)
dim(dtms)
inspect(dtms)
freq <-colSums(as.matrix(dtms))
freq

# frequencies of words
table(freq)
# Below we specify that we want terms / words
# which were used 50 or more times (in all documents / paragraphs).
findFreqTerms(dtms, lowfreq=50)
# save this frequencies to CVS file
freq50 <- findFreqTerms(dtms, lowfreq=50)
write.csv(freq50,file= "~/R/frequencies50.csv")
# Below we specify that we want terms / words
# which were used 100 or more times (in all documents / paragraphs).
findFreqTerms(dtms, lowfreq=100)
# save this frequencies to CVS file
freq100 <- findFreqTerms(dtms, lowfreq=100)
write.csv(freq100,file= "~/R/frequencies100.csv")

# Finding words which 'associate' together. Here, we are specifying
# the Term Document Matrix to use, the term we want to find associates
# for, and the lowest acceptable correlation limit with that term. This
# returns a vector of terms which are associated with 'navistar' at
# 0.50 or more (correlation) -- and reports each association in
# decending order.
findAssocs(dtms, "navistar", corlimit = .5)

# Plotting Frequent Words
freq <- sort(colSums(as.matrix(dtms)), decreasing = TRUE)
head(freq, 14)
wf <- data.frame(word=names(freq), freq=freq)
head(wf)

install.packages("ggplot2")
library(ggplot2)
subset(wf, freq>200) %>% ggplot(aes(word, freq))
subset(wf, freq>200)

install.packages("dplyr")
library(dplyr)
subset(wf, freq>200) %>% ggplot(aes(word, freq)) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=45, hjust=1))

# Generating a Word Cloud
install.packages("wordcloud")
library(wordcloud)
set.seed(123)
wordcloud(names(freq), freq, min.freq=100,random.color=TRUE,colors=rainbow(7),random.order = FALSE)

