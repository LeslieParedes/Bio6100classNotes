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

#if statements
#if(condition){expresion1} if is true the expression will be execute if is false the expression will be skip
if(condition) {expression1} else {expression2}

### blocks of code
#Block A comes with if statement follow with a (condition) {expression any line of R code or function} follow by Block B
##other option of complex statements:
#block A if (codition 1){expression 1} else
            #if (condition) {expression 2} else
 #block B
##condition 1 true, condition 2 false = block A, expression 1, block B, same as both condition true.
## if both condition are false we gonna have block A and block B.
## if we have condition 1 false and condition 2 true we gonna have block A, expression 2 and block B

###
z<- signif(runif(1), digits = 2)
print(z)
if (z>0.5) cat(z, "is a bigger than average number", "\n") #nothing printed because value of z is smaller

if (z>0.8){cat(z,"is a larger number","\n")} else
  if (z<0.2){cat(z,"is a small number","\n")} else
  {cat(z,"is a number of typical size","\n")
    cat("z^2=",z^2,"\n")}


#this does not do anything
if (z>7) print(z)
#probably not what you want
if (z<7) print(z)
#use subsetting
print(z[z<7])

#if else vectors, evaluate each element on the vector
tester<-runif(1000)
eggs<-ifelse(tester>0.35,rpois(n=1000,lambda = 10.2),0) ###0.35 is the 35% individuals parasitates, rpois poisson distribution 0 referes to o eggs
hist(eggs)

###probability values
pVals<-runif(1000)
z<-ifelse(pVals<=0.025,"lowerTail","nonSig")
z[pVals>=0.975]<-"upperTail"
table(z)
### another way
z1<-rep("nonSig",length(pVals)) #set the elements
z1[pVals<=0.025]<-"lowerTail"
z1[pVals<=0.975]<-"upperTail"
table(z1)
