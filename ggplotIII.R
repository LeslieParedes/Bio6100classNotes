## ggplot III
#colors

devtools::install_github("wilkelab/cowplot")
install.packages("colorspace",repos="http://R-Forge.R-project.org")
devtools::install_github("clauswilke/colorblindr")
install.packages("wesanderson")

library(ggplot2)
library(ggthemes)
library(colorspace)
library(colorblindr)
library(wesanderson)
library(ggsci)

d<-mpg
table(d$drv)
p1<-ggplot(d)+
  aes(x=drv)+
  geom_bar(color="black",fill="cornsilk")
print(p1)

p1<-ggplot(d)+
  aes(x=drv, fill = fl)+
  geom_bar()
print(p1)

p1<-ggplot(d)+
  aes(x=drv, fill = fl)+
  geom_bar(alpha=0.3, position = "identity") #alpha is the transparency max 1
print(p1)

p1<-ggplot(d)+
  aes(x=drv, fill = fl)+
  geom_bar(position = "fill") #proportions of observations
print(p1)

#dodge position for multiple bars, best
p1<-ggplot(d)+
  aes(x=drv, fill = fl)+
  geom_bar(position = "dodge",color="black",linewidth=0.5)
print(p1)

#ggplot only admit data frames
d_tiny<-tapply(X=d$hwy,
               INDEX = as.factor(d$fl),
               FUN = mean) #calculate the means
print(d_tiny)
str(d_tiny)
d_tiny<-data.frame(hwy=d_tiny)
print(d_tiny)
d_tiny<-cbind(fl=row.names(d_tiny),d_tiny)
print(d_tiny)

#only shows the mean of the data
p2<-ggplot(d_tiny)+
  aes(x=fl, y=hwy,fill = fl)+
  geom_col()
print(p2)

#basic boxplot, working with all data
p1<-ggplot(d)+
  aes(x=fl, y=hwy,fill = fl)+
  geom_boxplot()
print(p1)

p1<-ggplot(d)+
  aes(x=fl, y=hwy)+
  geom_boxplot(fill="thistle",outlier.shape = NA)+
  geom_point(position = position_jitter(width = 0.3,height = 0.7),color="grey60",size=2) #jitter separates the points
print(p1)

