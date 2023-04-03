################################################################################
# Script: analisis.R
# Autor: Santiago Ismael Flores Chávez
# Fecha de creación: 3 de abril de 2023
# Descripción: ...

################################################################################

# Carga de librerías necesarias


################################################################################

# Importando el dataset a R

bd_games <- read.csv("data/games.csv", header = TRUE, sep = ",")

# Creando vectores con los títulos del dataset

column_names <- names(bd_games)
cat(column_names, sep = "\n")
