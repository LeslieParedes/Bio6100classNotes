## ----setup, include=FALSE---------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----eval=TRUE,echo=TRUE----------------------------------------------------------------------------------------------------
# r code can be used here!
print(runif(10))
plot(runif(10),runif(10))



## ----echo=TRUE, eval=TRUE---------------------------------------------------------------------------------------------------
#here is a new chunk of code, distant from the first one 

z<-1:10
print(z)
#end of the second chunk

