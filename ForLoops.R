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
species_area_plot <- function(A=1:5000,c= 0.5,z=0.26) {
  plot(x=A,y=species_areas_curve(A,c,z),type="l",xlab="Island Area",ylab="S",ylim=c(0,2500))
  mtext(paste("c =", c,"  z =",z),cex=0.7)
  #      return()
}
species_area_plot()

### global variables
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
par(mfrow=c(3,4))
for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i],z=z_pars[j])
  }
}

par(mfrow=c(1,1)) ## restore to default values

####Looping with while or repeat function
# looping with for
cut_point <- 0.1
z <- NA
ran_data <- runif(100)
for (i in seq_along(ran_data)) {
  z <- ran_data[i]
  if (z < cut_point) break
}
print(z)
print(i) #point at the code interaction ends

### # looping with while (instead of for loops)
## while acts like conditional
z <- NA
cycle_number <- 0 #countable variable as in for loop
while (is.na(z) | z >= cut_point) {
  z <- runif(1)
  cycle_number <- cycle_number + 1

}
print(z)
print(cycle_number)
## this code: is not a good code

### expand.grid() function to create a data frame with parameter combinations
expand.grid(c_pars,z_pars) #automatically set two variables with those vectors,with unique combinations
df<- expand.grid(c_pars=c_pars,z_pars=z_pars)
head(df)
str(df)

##################################################
# function: sa_output
# Summary stats for species-area power function
# input: vector of predicted species richness
# output: list of max-min, coefficient of variation
#-------------------------------------------------
sa_output <- function(S=runif(10)) {

  sum_stats <- list(s_gain=max(S)-min(S),s_cv=sd(S)/mean(S))

  return(sum_stats)
}
sa_output()

# Build program body with a single loop through
# the parameters in modelFrame

# Global variables
area <- 1:5000
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
# set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars)
model_frame$s_gain <- NA #create other column
model_frame$s_cv <- NA #create other column
print(model_frame)

# cycle through model calculations
for (i in 1:nrow(model_frame)) {

  # generate S vector
  temp1 <- species_areas_curve(A=area,
                              c=model_frame[i,1],# row i first column
                              z=model_frame[i,2]) #row i second column
  # calculate output stats
  temp2 <- sa_output(temp1) # is a list!!
  # pass results to columns in data frame
  model_frame[i,c(3,4)] <- temp2

}
print(model_frame)

###
library(ggplot2)

area <- 1:5 #keep this very small initially
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

# set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars,A=area)
model_frame$S <- NA

# loop through the parameters and fill with SA function --- cycling over the parameters
for (i in 1:length(c_pars)) {
  for (j in 1:length(z_pars)) {
    model_frame[model_frame$c==c_pars[i] & model_frame$z==z_pars[j],"S"] <-   species_areas_curve(A=area,c=c_pars[i],z=z_pars[j])
  }
}

## another way, easier.. don't look over the parameters
for (i in 1:nrow(model_frame)) {
  model_frame[i,"S"] <- species_areas_curve(A=model_frame$A[i], #single value from A
                                           c=model_frame$c[i], # single value from c
                                           z=model_frame$z[i]) #single value from z
}
head(model_frame) #long format,

### plotting_ ggplot is doing the loops for us

p1 <- ggplot(data=model_frame) #first command takes the data frame
p1 + geom_line(mapping= aes(x=A,y=S)) + #area x and s in y
  facet_grid(c~z)

p2 <- p1
p2 + geom_line(mapping=aes(x=A,y=S,group=z)) +
  facet_grid(.~c)
p3 <- p1
p3 + geom_line(mapping=aes(x=A,y=S,group=c)) +
  facet_grid(z~.)
