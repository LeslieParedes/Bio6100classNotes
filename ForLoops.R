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
