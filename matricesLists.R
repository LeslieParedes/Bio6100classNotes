#Matrices and lists
#4 February 2025

#Matrices: atomic vector that is organized into rows and columns

my_vec<-1:12
m<-matrix(data = my_vec,nrow=4)
print(m)
m<- matrix(data=my_vec,ncol=3,byrow=TRUE)
print(m)


#Lists are atomic vectors but each element can hold things of different types and sizes

my_list<-list(1:10,
              matrix(1:8,nrow=4,byrow=TRUE),
              letters[1:3],
              pi)
str(my_list) #structure of the list
print(my_list)

my_list[4]
my_list[[4]]-3 #double braquets

#is a list has 10 elements it is like a train with 10 cars, but [[5]] gives yoy the contents of car #5

my_list[[2]]
my_list[[2]][4,1] #selecting the matrix in number 2 of the list and selecting row 4 and column 1

my_list2<-list(tester=FALSE,little_m=matrix(1:9,nrow=3))
print(my_list2)
my_list2$little_m[2,3] #get row 2, column 3
my_list2$little_m[2,] #get row 2, all columns
my_list2$little_m[,2] # get all rows, second column
my_list2$little_m[2] # second element of the vector, matrix have two dimensions so is not a good way to use a matrix

# unlist function
unrolled<-unlist(my_list2)
print(unrolled)
library(ggplot2)
y_var<-runif(10)
x_var<-runif(10)
my_model<-lm(y_var~x_var)
qplot(x=x_var,y=y_var)
print(my_model)

print(summary(my_model))
str(summary(my_model))
summary(my_model)$coefficients
summary(my_model)$coefficients["x_var","Pr(>|t|)"] #p value
summary(my_model)$coefficients [2,4] #coefficient matrix
u<-unlist(summary(my_model))
print(u)

my_slope<-u$coefficients2 #saving the information in other variables
my_pval<-u$coefficients8 #saving the information in other variable

#DATA FRAME
#are atomic vectors same length. Creating variables:
var_a<-1:12
var_b<-rep(c("Con","LowN","HighN"),each=4)
var_c<-runif(12)
d_frame<-data.frame(var_a,var_b,var_c) #each variable have the same length
print(d_frame)
str(d_frame) #
