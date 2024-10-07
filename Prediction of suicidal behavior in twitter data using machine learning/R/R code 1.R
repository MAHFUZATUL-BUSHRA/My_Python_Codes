
data1 <- read.csv("Data.csv",True,",")
class(data1)
head(data1)
library(leaps)
library(MASS)
reg1=regsubsets(class~WC+WPS+Qmarks+Unique+Dic+Sixltr+funct+pronoun+ppron+i+we+you+shehe+they+ipron+article+verb+auxverb+past+present+future+adverb+preps+conj+negate+quant+number+swear+social+family+friend+humans+affect+posemo+negemo+anx+anger+sad+cogmech+insight+cause+discrep+tentat+certain+inhib+incl+excl+percept+see+hear+feel+bio+body+health+sexual+ingest+relativ+motion+space+time+work+achieve+leisure+home+money+relig+death+assent+nonfl+filler,data=data1, nvmax=4, really.big=T) #At most four (4) features

summary(reg1)

summary(data1)
mean (data1$death)
x<- mean(data1$ leisure)
