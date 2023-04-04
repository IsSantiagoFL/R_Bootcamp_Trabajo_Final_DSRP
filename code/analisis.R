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

# 1. Creando vectores con los títulos del dataset

column_names <- names(bd_games)
cat(column_names, sep = "\n")

# 2. Creando un vector numérico con el precio final de los vídeo juegos

precio_final <- bd_games$price_final
class(precio_final)

# 3. Creando una condición lógica de precios bajos (ejemplo precios menores a 10.99) en el data frame original
 
precios_bajos <- precio_final < 10.99

bd_games_precios_bajos <- bd_games[precios_bajos, ]

# 4. Sumar 5 al vector creado: precio_final
precio_final_aumentado <- precio_final + 5




