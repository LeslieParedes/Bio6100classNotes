## ggplot graphics

library(ggplot2)
library(patchwork)
install.packages("ggthemes")
library(ggthemes)
# p1<-ggplot(data = DATA) +
#   aes(MAPPINGS)+
#   GEOM_FUNCTION (aes(MAPPINGS),
#                   stat=STAT,
#                   position=POSITION)+
# COORDINATE_FUNCTION +
# FACET_FUNCTION


#functions in ggplot

my_vec<-seq(1,100,by=0.1)
d_frame<-data.frame(x=my_vec,y=sin(my_vec))
ggplot(data = d_frame)+
  aes(x=x,y=y)+
  geom_line()

d_frame<-data.frame(x=my_vec,y=dgamma(my_vec,shape=5,scale=3))
ggplot(data = d_frame)+
  aes(x=x,y=y)+
  geom_line()

#user defined functions
my_fun<-function(x) sin(x) + 0.1*x
d_frame<-data.frame(x=my_vec,y=my_fun(my_vec))

p1 <- ggplot(data = d_frame)+
  aes(x=x,y=y)+
  geom_line()+
  theme_classic()
print(p1)
p1+theme_linedraw()
p1+theme_dark()
p1+theme_base()
p1+theme_par() #matches current par setting in base
p1+theme_void() #only data without labels and axes
p1+theme_solarized()
p1+theme_economist()
p1+theme_gray()#default theme
