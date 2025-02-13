#working with funcitions
#11 February 2025

sum(3,2) #a "prefix" functions
3+2 #an "operator" function
`+`(3,2)
y<-3
print(y)
`<-`(yy,3)
print(yy)

sd #shows the code
sd(c(3,2)) #call the function with parameters
sd() #some functions work this way others not

#how to build a function
functionName<-function(parX=defaultX,parY=defaultY, parZ=defaultZ) {
  #curly bracket open marks the start of the function body
  #Body of the function goes here
  #lines of R code and annotations
  #May also create local variables and functions

  return(z) #returns from the function a single element (z could be a list)

}
functionName(parX = myMatrix,parY = "Order", parZ = c(0.3,1.6,2.6))

#Example
HardyWeinberg<-function(p=runif(1)){
  q<-1-p
  fAA<-p^2
  fAB<-2*p*q
  fBB<-q^2
  vecOut<-signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits = 3)
  return(vecOut)
  }
HardyWeinberg()
pp<-0.6
HardyWeinberg(p=pp)
print(pp)

###other way to
HardyWeinberg2<-function(p=runif(1)){
  if (p> 1.0|p< 0.0) {
    return("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q<-1-p
  fAA<-p^2
  fAB<-2*p*q
  fBB<-q^2
  vecOut<-signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits = 3)
  return(vecOut)
}
HardyWeinberg2()
HardyWeinberg2(1.1) #error printed

HardyWeinberg3<-function(p=runif(1)){
  if (p> 1.0|p< 0.0) {
    stop("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q<-1-p
  fAA<-p^2
  fAB<-2*p*q
  fBB<-q^2
  vecOut<-signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits = 3)
  return(vecOut)
}
HardyWeinberg3(1.1)


### varible z only exist in the function
my_func<- function(a=3,b=4){
  z<-a+b
  return(z)
}
my_func()
##

my_fun_bad<-function(a=3){
  z<-a+b
  return(z)
}
my_fun_bad() #the variable b was not declared in the function so doesn't exist in the environment of the function

b<-100

my_fun_bad() # now it works because we created a global variable b

#correct way to...but bb will be only a local variable inside of the function
my_fun_ok<-function(a=3){
  bb<-100
  z<-a+bb
  return(z)
}
my_fun_ok()

## fit_linear is a simple regression line
##inputs: numeric vector of predictor(x) and response (y)
#outputs: slope and p-value

fit_linear<-function(x=runif(20),y=runif(20)){
  my_mod<-lm(y~x) #fit the model
  my_out<-c(slope=summary(my_mod)$coefficients[2,1],
            p_value=summary(my_mod)$coefficients[2,4])
  plot(x=x,y=y)
  return(my_out)
  }
fit_linear() #random results

## more complex default value in the way the input structure
fit_linear2<-function(p=NULL){
  if(is.null(p)) {
    p<- list(x=runif(20),y=runif(20))
  }
    my_mod<-lm(p$y~p$x)
    my_out<-c(slope=summary(my_mod)$coefficients[2,1],
            p_value=summary(my_mod)$coefficients[2,4])
  plot(p$y~p$x)
  return(my_out)
}
fit_linear2()

##I'm listing 10 points, x is not random, and y will sorted
my_pars<-list(x=1:10,y=sort(runif(10)))
#calling the function
fit_linear2(p=my_pars)

###Help menu---write the function that we want read
z<-c(runif(99),NA) #
mean(z) #because there is a NA, no output
mean(x=z,na.rm=TRUE) # na.rm remove the NA
mean(x=z,na.rm = TRUE,trim = 0.05) #trim will move the mean cutting the sides of each side
l<-list(x=z,na.rm=TRUE,trim=0.05)# bundle parameters as a list
do.call(mean,l) #use the do.call function with the function name and the parameter list



