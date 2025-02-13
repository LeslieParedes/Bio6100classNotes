### Control structures

## logical operators
#inequalities
5>3
5<3
5>=5
5<=5
5==3
5!=3
FALSE&FALSE
FALSE&TRUE
TRUE&TRUE
5>3 & 1!=2
1==2 & 1!=2

#vectors
1:5>3 #five comparaciones
a<-1:10
b<-10:1
a>4 & b>4

#set operations
a<-1:7
b<-5:10
#union to get all elements
union(a,b) #combinate, if there are elements common elements just will put once
c(a,b) #concatenate duplicate the elements
unique(c(a,b)) #returns the elements once
#intersect to get common elements
intersect(a,b)
#distinct elements
setdiff(a,b)
#if there are equal or not
setequal(a,b)

z<-matrix(1:12,nrow = 4,byrow = TRUE)
z1<-matrix(1:12,nrow = 4,byrow = FALSE)
#comparition
z==z1 #compare element by element
identical(z,z1)
##
d<-12
d %in% union(a,b) #look into the vectors
is.element(d,union(a,b))

d<-c(10,12)
d %in% union(a,b) #look comparision into the vectors
d %in% a

#statements
#if(condition){expresion1} if is true the expression will be execute if is false the expression will be skip
if(condition) {expression1} else {expression2}
