#Introduction to Rsctipts
# 28 Junuary
# LPT
# Using the assigmnent operator
x<-5 # preferred
y=4 #legal but not used except in function defaults
y = y +1.1
print(y)
y<-y+1.1
print(y)
z <- 3 # begin eith lower case letter
plantHeighta<- 10 #option "camelCaseformatting"
plant.height<-4.2
plant_height<- 3.3
.<-5.5
print(.)
# the combine function
z<- c(3,5,5,6) #combine or concatenate
print(z)
typeof(z)
is.numeric(z)

# c() always "flattens" to an atomic vector
z<- c(c(3,4), c(5,6))
print(z)
#character strings with single or double quotes
z<-c("perch", "bass", 'trout')
print(z)
typeof(z)

#use both with an internal quote
z<-c("This is only 'one' character string", 'a second')
print(z)
typeof(z)

#logicals
# boolean, not with quotes, all caps
z<- c(TRUE,TRUE,FALSE)
print(z)
is.logical(z)
is.integer(z)

z<-c(1.1,1.2,3,4.4)
typeof(z)
is.numeric(z)
z<-as.character(z)# as. coerces variables
print(z)
typeof(z)

length(z) #gives number of elements
length(y) #throws error if variable does not exist

#add names later after variable is created
z<- runif(5)
print(z)
names(z)<- c("chow","pug","beagle","greyhound","akita")
print(z)
print(z[2])
print(z["pug"])

#add names when variables is built (with or without quotes)
z2<-c(gold=3.3, silver=10, lead=2)
print(z2)
#Reset names
names(z2)<-NULL
#names can be added for only a few elements
names(z2)<-c("copper","zinc")
print(z2)
#NA values for missing data
z<-c(3.2,3.3,NA)
typeof(z)
length(z)
z1<-NA
typeof(z1)
is.na(z)#to find missing values
mean(z)
is.na(z)
!is.na(z)# ! means not
mean(!is.na(z)) #select the elements not missing but wrong answer base on TRUE FALSE!!
mean(z[!is.na(z)])#correct use of indexing

#NaN, -Inf, and Inf from numeric division
z<- 0/0 #NaN
typeof(z)
print(z)
z<-1/0
print(z)
z<--1/0
print(z)

#NULL is an object that is nothing
z<-NULL
typeof(z)
length(z)
is.null(z)

#All atomics are of the same type, if they are different, R coerces them
#logical -> integer -> double -> character
a<- c(2,2.0)
print(a)
typeof(a)
b<-c("purple","green")
typeof(b)
d<-c(a,b)
print(d)
typeof(d)

a<-runif(10)
print(a)

#comparison operators yield a logical result
a>0.5
#How many elements are greater than 0.5?
sum(a>0.5)
#What is the proportion of the vector elements are grater than 0.5?
mean(a>0.5)
#brake down the result
.<-a >0.5
print(.)
.<-as.integer(.)
print(.)
print(sum(.))
print(mean(.))

mean(rnorm(10000)>2)

#Vectorization
#adding a constant to a vector
z<- c(10,20,30)
z+1
#what happens when vectors are added?
y<-c(1,2,3)
z+y
z^2
#but what if vector lenghts are not equal?
x<-c(1,2)
z+x# longitud de objeto mayor no es múltiplo de la longitud de uno menor

