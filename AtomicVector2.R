# More properties of atomic vectors
# 30 January 2025
# LPT

# create an empty vector, specify mode and legth

z<- vector(mode = "numeric", length = 0)
print(z)
#now adding elements
z<- c(z,5)
print(z)

# this is "dinamic sizing" is very slow
# has 100 0s is a numeric vector
z<-rep(0,100)
head(z)
#but would be better to star with NAs
z<-rep(NA,100)
head(z)
# but what is its type?
typeof(z)

z[1]<-"Washington" #changing only the first element
head(z)
typeof(z)
typeof(z[2]) # change the type to character


my_vector<-runif(100)
tail(my_vector)
my_names<-paste("Species",seq(1:length(my_vector)),sep = "") #will paste the name species to all the elements of the vector
head(my_names)
names(my_vector)<-my_names # combine the both vectors in one with name function
head(my_vector)
str(my_vector)

#rep for repeating elements
rep(0.5,6) #give the element or vector and number of times to repeat
rep(x=0.5, times=6) #is better use the argument names and the order is not important
my_vec<-c(1,2,3)
rep(x=my_vec,time=2) #it applies to vectors too
rep(x=my_vec, each=2) #repeat each element individually
rep(x=my_vec,times=my_vec) #
rep(x=my_vec, each=my_vec) #it takes only the first element of the vector to repeat in this case is one

#seq function
seq(from=2, to=4) #prefix function
2:4 #this is another way to run this function(infix function)
`:`(2,4) # anther way
seq(from=2, to=4, by=0.5)
x<-seq(from=2, to=4, length=7)#specify the length
print(x)
my_vec<-1:length(x)
print(my_vec)
seq_along(my_vec)#same like above
seq_len(5) #faster than 1:5

#rnorm function (random numbers)
runif(5)#uniform values
runif(n=5,min = 100,max = 101) #specify between 100 and 101
rnorm(6) #random normal values with mean 0 and standar deviation 1
rnorm(n=5, mean = 100, sd=30) #random normal values with mean

#explore distributions by sampling and plotting
library(ggplot2)
z<- runif(1000) #uniform
qplot(x=z) # quick way to see the data
z<-rnorm(1000) #normal distribution
qplot(x=z)

#from an existing vector
long_vec<- seq_len(10)
typeof(long_vec)
str(long_vec)
sample(x=long_vec)# with no other params, this reorders the vector
sample(x=long_vec, size = 3) #specify a number without replacement
sample(x=long_vec,size = 16, replace = TRUE) #can generate duplicates
my_weights<-c(rep(20,5),rep(100,5)) #create a set of non-zero positive probability weights (integrate or real) for sampling
print(my_weights)
sample(x=long_vec, replace = TRUE, prob = my_weights) #sampling with replacement and wights
sample(x=long_vec, replace = FALSE, prob = my_weights) #sampling without replacement and wights


z<-c(3.1,9.2,1.3,0.4,7.5)
#positive index values
z[c(2,3)] #second and three element of the vector
z[-c(2,3)] #everything except the 2 and 3 elements
z[z<3] #selecting conditions
tester<-z<3
print(tester)
z[tester]

which(z<3) #positions of the elements not the values
z[which(z<3)] #shows the values
z[-(length(z):(length(z)-2))] #is a formula to select the elements
