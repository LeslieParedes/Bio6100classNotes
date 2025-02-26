## dplyr: data manipulation and structuring data frames
#filter(), arrange(), select(), summarize() and group_by(), and mutate()

#start with a built-in dataset

library(tidyverse)

#specify which package you're using
dplyr::filter()

data(starwars)
class(starwars) #tbl (tibble): do "less as a tradeoff to make code simpler and less prone to crashing

glimpse(starwars) #like str() function
head(starwars)

#cleaning up the dataset
#base R has the complete.case functions this will remove rows with NAs
starwarsclean<- starwars[complete.cases(starwars[,1:10]),]
is.na(starwarsclean[,1]) #first column
anyNA(starwarsclean[,1:10]) #for all

#filter() function, will pick subset observations by their values, use >,>=,<,<=,==,!
#logical operator like & and |
filter(starwarsclean, gender=="masculine"& height < 180)
filter(starwars,gender=="masculine", height<180,height>100)
filter(starwars,eye_color%in% c("blue","brown")) #use %in% is similar to ==

#arrange() reorder rows
arrange(starwarsclean,by=height) #ascending order
arrange(starwarsclean,by=desc(height) )# descending order
arrange(starwarsclean,height, desc(mass)) # any additional column will brake ties in presending column
starwars1<-arrange(starwars,height)
tail(starwars1)

#select() choose variables
select(starwarsclean, 1:10)
#same but using base r
starwarsclean[1:10,]

#
select(starwarsclean, name:homeworld)
select(starwarsclean, -(films:starships)) #subset everything except particular variables
#rearrange columns
select(starwarsclean, homeworld, name, gender, species,everything()) ##everething will select the rest

select(starwarsclean, contains("color")) #other helpers include: ends_with, starts_with, matches (reg ex), num_range

#rename columns
select(starwars, haircolor=hair_color)
rename(starwarsclean, haircolor=hair_color) #keeps all the variables

#mutate() create new variables with functions fo existing variables
#create a column that's height divided by mass
mutate(starwarsclean, ratio=height/mass)
starwars_lbs<- mutate(starwarsclean, mass_lbs=mass*2.2)
select(starwars_lbs,1:3,mass_lbs,everything()) #allows to bring it to the begining

#if you only want the new variable you can use the transmutate function
transmute(starwarsclean, mass_lbs=mass*2.2)
transmute(starwarsclean, mass, mass_lbs=mass*2.2)

#summarize, group_by(), collapse values down to a single summary
summarize(starwarsclean, meanHeight=mean(height))
summarize(starwars, meanHeight=mean(height)) #dosent work if the data set is not clean
summarize(starwarsclean, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())

#use gorup_by() for additional calculations
starwarsGender<-group_by(starwars,gender)
head(starwarsGender)

summarize(starwarsGender, meanHeight=mean(height, na.rm=TRUE),number=n()) #first group and then summarize

## pipe statements: sequence of actions that will change the data set it will let you pass an intermediate result onto the next function in sequence
#you should avoid this when you need manipulate more that one object
#formatting: have space before it and usually followed by a new line

starwarsclean%>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=T),number=n())

## case_when() is useful for multiple conditional statements
starwarsclean%>%
  mutate(sp=case_when(species=="Human"~"Human",TRUE~"Non-human"))%>%
  select(name,sp,everything())

#long to wide format and vice-versa
glimpse(starwarsclean)
#make data set wider
wideSW<-starwarsclean%>%
  select(name,sex,height)%>%
  pivot_wider(names_from = sex,values_from = height,values_fill = NA)

wideSW

pivotSW<-starwars%>%
  select(name,homeworld)%>%
  group_by(homeworld)%>%
  mutate(rn=row_number())%>%
  ungroup()%>%
  pivot_wider(names_from = homeworld,values_from = name)
pivotSW

#make the data set longer
glimpse(wideSW)
wideSW%>%
  pivot_longer(cols = male:female,names_to = "sex",values_to = "height",values_drop_na = T)




