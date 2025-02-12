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
