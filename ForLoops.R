### For Loops
## 18 Feb 2025

#anatomy of a for loop
#for (var in seq) { #start if for loop
  #body of for loop
#} #end of for loop

##use the name of the variable as i, j, or k)
for(i in 1:5) { #value of variable i
  cat("stuck in a loop","\n") #statement
  cat(3+2,"\n") #second statement
  cat(runif(1),"\n") #third statement
} #end
print(i) #value

my_dog<-c("chow","akita","malamute","husky","samoyed")
for (i in 1:length(my_dog)) {
  cat("i=",i,"my_dog[i]=", my_dog[i],"\n")
}

zz<-5
for (i in seq_len(zz)){
  cat("i=",i,"my_dog[i]=",my_dog[i],"\n")
}
#sometimes for loops are not needed
for (i in 1:length(my_dog)) {
  my_dog[i]<-toupper(my_dog[i])
  cat("i=",i,"my_dog[i]=", my_dog[i],"\n")
}
#is the same as:
my_dog<-toupper(my_dog)
print(my_dog)

z<-c(10,2,4) #three intergents
for (i in 1:length(z)){
  cat("i=",i,"z[i]=",z[i],"\n")
}
print(i)

###what if we want to work only the odd numbered elements?

z<- 1:20
for (i in 1:length(z)){
  if(i%% 2==0) next
  print(i)
}

for (i in 1:length(z)){
  if(i%% 2!=0) next
  print(i)
}

## brake function
# random walk
#stochastic random walk
# input: times =numbers of time steps
# n1= initial population size (=n[1])
# lambda =finite rate of increase, 1.0 no change, if 1.1-- 10% increase each time step, 0.98 2% decrease each time step
# noise_sd = sd of normal distribution with mean 0
# output: vector n with population sizes>0 until extinction then NA

library(ggplot2)
ran_walk<-function(times=100, n1=50,lambda=1.00, noise_sd=10){
  n<-rep(NA,times) #create a output vector
  n[1]<-n1 #initialize with starting population size
  noise<-rnorm(n=times,mean=0,sd=noise_sd) #create noise vector
  for (i in 1:(times-1)) {
   n[i+1]<-lambda*n[i]+noise[i]
   if (n[i+1]<=0) {
     n[i+1]<-NA
     cat("Population extinction at time", i+1,"\n")
     break}
  }

  return(n)
  }

ran_walk()
qplot(x=1:100,y=ran_walk(),geom = "line")
#noise off= line
qplot(x=1:100,y=ran_walk(noise_sd = 0),geom = "line")
#adding lambda increase
qplot(x=1:100,y=ran_walk(noise_sd = 0, lambda = 1.1),geom = "line")
#adding lambda decrease
qplot(x=1:100,y=ran_walk(noise_sd = 0, lambda = 0.98),geom = "line")

####double loops
m<-matrix(round(runif(20),digits = 2),nrow = 5)
#loop over rows
for (i in 1:nrow(m)){
  m[i,]<-m[i,]+1
}
print(m)

for (j in 1:ncol(m)){
  m[j,]<-m[j,]+j
}
print(m)

###
#species area curve
#create a power function relationship for S and A
# input: A is a vector of island areas
#        c is the intercept constant
        # z is slope constant
# output: S is a vector of species richness values

species_areas_curve<-function(A=1:5000,c=0.5,z=0.26){
  S<-c*(A^z)
  return(S)
}
head(species_areas_curve())

#### species area plot
