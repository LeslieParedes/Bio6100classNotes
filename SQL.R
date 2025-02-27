## SQL
install.packages("sqldf")
library(sqldf)
library(tidyverse)

#Read in the data
species_clean<-read.csv("site_by_species.csv")
var_clean<-read.csv("site_by_variables.csv")
head(species_clean)
head(var_clean)
## using operations functions
#how to subset rows:

#dplyr method
species<-filter(species_clean, Site<30)
var<-filter(var_clean, Site<30)
view(var)

##SQL
query<-"SELECT Site, Sp1, Sp2, Sp3 FROM species WHERE Site<'30'"
sqldf(query)

## subsetting columns
#dplyr
edit_species<-species%>%
  select(Site, Sp1,Sp2,Sp3)
edit_species<-species%>%
  select(1,2,3,4)
## SQL method
query="SELECT * FROM species"
a<-sqldf(query)
sqldf(query)

#renaming column
#dplyr
species<-rename(species, Long=Longitude.x.,Lat=Latitude.y.)
#pull out all the numeric columns
num_species<-species%>%
  mutate(letters=rep(letters,length.out=length(species$Site)))
num_species<-select(num_species,Site,Long,Lat,Sp1,letters)
num_species_edit<-select(num_species,where(is.numeric)) ## adding where is helper function serves to sort add condtions

##pivot longer will lengthen the data, decrease the number of columns and increase the rows. Can use gather ()
species_long<-pivot_longer(edit_species,cols = c(Sp1,Sp2,Sp3), names_to = "ID")
head(edit_species)
species_wide<-pivot_wider(species_long, names_from = ID)
species_wide


##aggregation some data
##SQL
query="SELECT SUM(Sp1+Sp2+Sp3) FROM species_wide GROUP BY SITE"
sqldf(query)

query="SELECT SUM(Sp1+Sp2+Sp3) AS Occurence FROM species_wide GROUP BY SITE"
sqldf(query)

#query="ALTER TABLE species_wide ADD new_column VARCHAR"

#2 files operation joining data sets together (same dimensions)
#left/right unions joins

# first clean-reset species var variables, and then filter
edit_species<-species_clean%>%
  filter(Site<30)%>%
  select(Site, Sp1,Sp2,Sp3,Sp4,Longitude.x.,Latitude.y.)

edit_var<-var_clean%>%
  filter(Site<30)%>%
  select(Site,Longitude.x.,Latitude.y.,BIO1_Annual_mean_temperature,BIO12_Annual_precipitation)
view(edit_species)

## left join-- stiching the matching rows of file B to file A. It requires a matching column
left<-left_join(edit_species,edit_var,by="Site")

right<-right_join(edit_species,edit_var,by="Site")
view(right)

inner<-inner_join(edit_species,edit_var,by="Site") ## retains the rows that match loses all the info that don't match
## full join the opposite of a inner
full<-full_join(edit_species,edit_var,by="Site")
view(full)

##SQL
query="SELECT BIO1_Annual_mean_temperature, BIO12_Annual_precipitation from edit_var LEFT JOIN edit_species ON edit_var.Site=edit_species.Site"
x<-sqldf(query)
x




