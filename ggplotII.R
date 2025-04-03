##ggplot II

library(ggplot2)
library(ggthemes)
library(patchwork)
g1<-ggplot(data=d_frame)+
  aes(x=x, y=y)+
  geom_point()+
  geom_smooth()
print(g1)

g2<-ggplot(data=d_frame)+
  aes(x=x, y=y)+
  geom_boxplot()
print(g2)

g1+g2

g1+g2 + plot_layout(ncol = 1, heights = c(2,1))

g1+g2 + plot_layout(ncol = 2, widths = c(2,1))

g1a<-g1+scale_x_reverse()
g1b<-g1+scale_y_reverse()
g1c<-g1+scale_x_reverse()+scale_y_reverse()
(g1|g1a)/(g1b|g1c)

(g1+ coord_flip()| g1a+ coord_flip())/(g1b+coord_flip()|g1c+coord_flip())
ggsave()#save the plot in pdf

d<-(mpg)
#mapping per color
m1<-ggplot(data = d_frame)+
  aes(x=x, y=y,color=class)+
  geom_point(size=3)
print(m1)
#mapping per shape
m1<-ggplot(data = d_frame)+
  aes(x=x, y=y,shape=class)+
  geom_point(size=3)
print(m1) # don't show because data are not for this
#mapping of a discrete variable to the size of the point
m1<-ggplot(data = d_frame)+
  aes(x=x, y=y,size=class)+
  geom_point()
print(m1)
#mapping a continuous variable to point size (bubble plot)
m1<-ggplot(data = d_frame)+
  aes(x=x, y=y,size =hwy)+ #variable
  geom_point()
print(m1)
#mapping a continuous variable to point color
m1<-ggplot(data = d_frame)+
  aes(x=x, y=y,color=hwy)+ #variable
  geom_point(size=5)
print(m1)

#mapping two variables to different aesthetics
m1<-ggplot(data = mpg)+
  aes(x=gispl, y=cty,shape=class, color=hwy)+
  geom_point(size=5)
print(m1)

#faceting variables for more effective groupings, split by row, column, or both
m1<-ggplot(data = mpg)+
  aes(x=displ, y=cty)+
  geom_point()
m1+facet_grid(class ~fl)

##rows = y, columns= x

m1+facet_grid(class ~fl, scales = "free_y")
m1+facet_grid(class ~fl,scales = "free")
m1+facet_grid(.~class)
m1+facet_grid(class~.)
m1+facet_wrap(.~class)
m1+facet_wrap(.~class+fl)#
m1+facet_wrap(.~class+fl,drop = FALSE)#
m1+facet_grid(class~fl)#

#using different geom
m1<-ggplot(data = mpg)+
  aes(x=displ, y=cty, color=drv)+
  geom_point()
m1+facet_grid(.~class)


m1<-ggplot(data = mpg)+
  aes(x=displ, y=cty, color=drv)+
  geom_smooth(se=FALSE,method = "lm")
m1+facet_grid(.~class)

m1<-ggplot(data = mpg)+
  aes(x=displ, y=cty)+
  geom_boxplot()
m1+facet_grid(.~class)

m1<-ggplot(data = mpg)+
  aes(x=displ, y=cty, group = drv, fill = drv)+
  geom_boxplot()
m1+facet_grid(.~class)

#simple plot
p1<-ggplot(data = d)+
  aes(x=displ, y=hwy)+
  geom_point()+
  geom_smooth()
print(p1)

#group command
p1<-ggplot(data = d)+
  aes(x=displ, y=hwy, group = drv)+
  geom_point()+
  geom_smooth()
print(p1)
#color command
p1<-ggplot(data = d)+
  aes(x=displ, y=hwy, colour = drv)+
  geom_point()+
  geom_smooth()
print(p1)
# fill (to object with areas of polygons)
p1<-ggplot(data = d)+
  aes(x=displ, y=hwy, fill = drv)+
  geom_point()+
  geom_smooth()
print(p1)
#separates
p1<-ggplot(data = d)+
  aes(x=displ, y=hwy, colour = drv, fill = drv)+
  geom_point()+
  geom_smooth()
print(p1)

p1<-ggplot(data = d)+
  aes(x=displ, y=hwy, col=drv)+
  geom_point(data = d[d$drv=="4",])+ #the only points showed in the graph
  geom_smooth()
print(p1)

p1<-ggplot(data = d)+
  aes(x=displ, y=hwy)+
  geom_point(aes(colour = drv))+
  geom_smooth()
print(p1)

p1<-ggplot(data = d)+
  aes(x=displ, y=hwy)+
  geom_point()+
  geom_smooth(aes(colour = drv))
print(p1)

#selecting some data only in the first layer
p1<-ggplot(data = d[d$drv!="4",])+
  aes(x=displ, y=hwy)+
  geom_point(aes(colour = drv))+
  geom_smooth()
print(p1)
