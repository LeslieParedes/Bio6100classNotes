## Probability distribution
# x continuous scale or disctrete distribution
# we want to describe de distribution
# mean, variance, skewness (simetria), kurtosis (how skiny)
## moments of the distribution (describing)
# data simplification
#statistical distribution (seven)

#DISCRETE DISTRIBUTIONS:
#Poisson
#Binomial (pbinom () function)
#Negative binomial

#CONTINUOUS DISTRIBUTIONS:
# uniform (two parameters associated with it: minimum and maximum (range))
  # puni() function
#normal (its parameters are mean and variance, are the parameter that we fit at it)
#beta
#gamma

# the area of interest are the extreme data (less than 0.05-- pvalue)
 # cumulative distribution function take the extreme values and plot them to track the cumulative area on the left of the curve
    #this curve is going to rise to 1 to locate where that extreme values are in proportion

library(ggplot2)
#creating a function for plot an histogram
my_histo <- function(x=NULL) {
  if (is.null(x)) df=data.frame(x=runif(1000)) else df<-data.frame(x=x) #statement
  p1<-ggplot(data=df)+
    aes(x=x)+
    geom_histogram(color="black",fill="goldenrod")
  print(p1)

}
my_histo()

#POISSON DISTRIBUTION
# parameters describe discrete distribution X>=0
#random events with a constant rate lambda
#(observations per time or per unit area)
#Parameter lambda >0

## note: "zero-inflated poisson" has an additional process
# generate zeroes (see ifelse() function)

#note :"zero-censored poisson" occurs when zeroes are not recorded

library(MASS)

# "d" function generates probability density
hits<- 0:10
myVec<-dpois(x=hits,lambda = 1)
my_histo(myVec)
plot(myVec, type = "b") #better view of distribution

myVec<-dpois(x=hits,lambda = 2)
plot(myVec, type = "b") #distribution move to the right

hits<-0:50
myVec<-dpois(x=hits,lambda = 20)
plot(myVec, type = "b") #poisson distribution with lambda of 20 pretty close to normal distribution

hits<-0:15
myVec<-dpois(x=hits,lambda = 2.3)
plot(myVec, type = "b")

#sum of density function=1.0 (total area under the curve)
sum(myVec)
head(myVec)
#for a lambda of 2 there is a probability of draw yield x=0
dpois(x=0,lambda = 2)

# "p" function generates cumulative probability density; gives the lower tail cumulative area of the distribution
hits<-0:10
myVec<-ppois(q=hits,lambda = 2)
plot(myVec,type = "b")

#what is the probability of getting 1 or fewer hits?
ppois(q=1, lambda = 2)

#the same using dpois function
p_0<-dpois(x=0,lambda = 2)
p_0
p_1<-dpois(x=1,lambda = 2)
p_1
p_0+p_1

#the q function is inverse of p function
#what are the numbers of hits corresponding to 50% of the probability mass
qpois(p=0.5,lambda = 2.5)
ppois(q=2,lambda = 2.5)

#rpois function is use to simulate data
ranPois<- rpois(n=1000,lambda = 2.5)
my_histo(ranPois)

## 95% of confidence interval of the data
quantile(x=ranPois,probs = c(0.025,0.975))

### BINOMIAL DISTRIBUTION
## p= probability of a dichotomous outcome
#size = number of trials
# x= possible outcomes
# outcome x is bounded between 0 and number of trials

#use "d" binom for density function
hits<-0:10
myVec<-dbinom(x=hits,size = 10,prob = 0.5)
plot(myVec,type = "b")

myCoins<-rbinom(n=50,size = 100,prob = 0.5)
my_histo(myCoins) #noise of the data

myCoins<-rbinom(n=5000,size = 100,prob = 0.5)
my_histo(myCoins) #we still see some noise

quantile(x=myCoins,probs = c(0.025,0.975))


## NEGATIVE BINOMIAL DISTRIBUTION
## number of failures (values of MyVec)
# in a series of (Bernouli) with p=probability of success
# before a target number of successes (=size)
# generates a discrete distribution that is more heterogeneous ("overdispersed") than Poisson

hits<-0:40
myVec<-dnbinom(x=hits,size = 5,prob = 0.5)
plot(myVec,type = "b")

#geometric series is a special case
myVec<-dnbinom(x=hits,size = 1,prob = 0.1)
plot(myVec,type = "b")
