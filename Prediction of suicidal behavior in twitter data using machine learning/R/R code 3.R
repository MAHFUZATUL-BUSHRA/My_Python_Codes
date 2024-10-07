head(data1)
library(ISLR)
library(knitr)
library(printr)
str(data1)
print(summary(data1))
sum(is.na(data1$sad))
data1=na.omit(data1)
sum(is.na(data1))
library(leaps)
library(MASS)
library(tidyverse)
library(caret)



dim(data1)

subset1 <- subset(data1,  select = Unique)
summary(subset1)


q=regsubsets(class~WC+WPS+Qmarks+Unique+Dic+Sixltr+funct+pronoun+ppron+i+we+you+shehe+they+ipron+article+verb+auxverb+past+present+future+adverb+preps+conj+negate+quant+number+swear+social+family+friend+humans+affect+posemo+negemo+anx+anger+sad+cogmech+insight+cause+discrep+tentat+certain+inhib+incl+excl+percept+see+hear+feel+bio+body+health+sexual+ingest+relativ+motion+space+time+work+achieve+leisure+home+money+relig+death+assent+nonfl+filler+class, data=data1)
summary(q)
reg1= regsubsets(class~WC+WPS+Qmarks+Unique+Dic+Sixltr+funct+pronoun+ppron+i+we+you+shehe+they+ipron+article+verb+auxverb+past+present+future+adverb+preps+conj+negate+quant+number+swear+social+family+friend+humans+affect+posemo+negemo+anx+anger+sad+cogmech+insight+cause+discrep+tentat+certain+inhib+incl+excl+percept+see+hear+feel+bio+body+health+sexual+ingest+relativ+motion+space+time+work+achieve+leisure+home+money+relig+death+assent+nonfl+filler,data=data1, nvmax=4, really.big=T) #At most four (4) features
summary(reg1)

a<-regsubsets(as.matrix(data1[,-1]),data1[,1])
summary(a)
b<-regsubsets(class~.,data=data1,nbest=2)
summary(b)