## ggplot graphics

library(ggplot2)
library(patchwork)
install.packages("ggthemes")
install.packages("extrafont")
library(extrafont)
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

p1+theme_classic(base_size = 30,base_family = "serif") # base_family is the font
#defaults:theme_grey,base_size=16, base_family="Helvetica")

font_import()#import the all the system fonts (runs once)
y

fonts()
p1+theme_classic(base_size = 35,base_family = "Georgia")#doesn't work in my R



p1 <- ggplot(data = d_frame)+
  aes(x=x,y=y)+
  geom_point(size=4,
             shape=21,
             color= "black",fill="cyan")+
  theme_bw()

print(p1)
p1 <- ggplot(data = d_frame)+
  aes(x=x,y=y)+
  geom_point(size=4,
             shape=21,
             color= "black",fill="cyan")+
  xlim(4,7)+
  ylim(-10,40)+
  theme_bw(base_size = 25,base_family = "Monaco")
print(p1)
