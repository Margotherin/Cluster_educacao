install.packages(c("readr", "dplyr"))
install.packages("data.table")
install.packages("ffbase", dependencies = TRUE)

library(dplyr)
library(readr)
library(data.table)
require(ffbase) #Carrega o pacote 

getwd()
setwd('C:/Users/Margot/Documents/Datalabe/cluster_educacao/Scripts')


ALUNO<-read.csv2.ffdf(file="C:/Users/Margot/Documents/Datalabe/cluster_educacao/DM_ALUNO.csv",sep="|",first.rows=1000000)

#salvar a base no formato 'ffdf' para que uma nova carga inicial não seja necessária numa próxima sessão. 
save.ffdf(ALUNO, dir="./ALUNO")

#pour un chargement quasi-immédiat
load.ffdf(dir="./ALUNO")

###selection des variables
## chargement de la BD
DM_ALUNO_var<-fread(file="DM_ALUNO_var.csv",sep=';',encoding = 'UTF-8')

##chargement des données des var ## chargement de la BD choisies
liste_col<- DM_ALUNO_var$Nome_var
DATA <-subset.ffdf(ALUNO,CO_UF_NASCIMENTO==33, select=DM_ALUNO_var$Nome_var)
save.ffdf(DATA, dir="./DATA")
#pour un chargement quasi-immédiat
load.ffdf(dir="./DATA")
###sélection de l'état de RJ
DATA<-ffwhich(DATA,CO_UF_NASCIMENTO==33)


