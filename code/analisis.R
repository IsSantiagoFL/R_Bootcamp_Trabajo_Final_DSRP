################################################################################
# Script: analisis.R
# Autor: Santiago Ismael Flores Chávez
# Fecha de creación: 3 de abril de 2023
# Descripción: ...

################################################################################

# Instalar las librerías necesarias

# Para hallar la 'moda' de un vector numérico
install.packages("DescTools")

# Carga de librerías necesarias

library(DescTools)


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

# 5. Dividir la puntuación entre dos

class(bd_games$positive_ratio)
nueva_puntuación <- bd_games$positive_ratio /2

# 6. Calcular la media, moda, max, min de los datos de tipo numérico (Verficar con la función Class)

str(bd_games)

class(bd_games$positive_ratio)
class(bd_games$user_reviews)
class(bd_games$price_final)
class(bd_games$price_original)
class(bd_games$discount) 


# Estadísticas para 'postive_ratio'
summary(bd_games$positive_ratio)

stats_positive_ratio <- list(
  mean = mean(bd_games$positive_ratio),
  mode = Mode(bd_games$positive_ratio),
  max = max(bd_games$positive_ratio),
  min = min(bd_games$positive_ratio)
)

cat(paste("Para la columna x:\n", 
          "Su media es: ", stats_positive_ratio$mean, "\n",
          "Su moda es: ", stats_positive_ratio$mode[1], "\n",
          "Su valor mínimo es: ", stats_positive_ratio$min, "\n",
          "Su valor máximo es: ", stats_positive_ratio$max))

# Estadísticas para 'user_reviews'
summary(bd_games$user_reviews)

stats_user_reviews <- list(
  mean = mean(bd_games$user_reviews),
  mode = Mode(bd_games$user_reviews),
  max = max(bd_games$user_reviews),
  min = min(bd_games$user_reviews)
)

cat(paste("Para la columna x:\n", 
          "Su media es: ", stats_user_reviews$mean, "\n",
          "Su moda es: ", stats_user_reviews$mode[1], "\n",
          "Su valor mínimo es: ", stats_user_reviews$min, "\n",
          "Su valor máximo es: ", stats_user_reviews$max))

# Estadísticas para 'price_final'
summary(bd_games$price_final)

stats_price_final <- list(
  mean = mean(bd_games$price_final),
  mode = Mode(bd_games$price_final),
  max = max(bd_games$price_final),
  min = min(bd_games$price_final)
)

cat(paste("Para la columna x:\n", 
          "Su media es: ", stats_price_final$mean, "\n",
          "Su moda es: ", stats_price_final$mode[1], "\n",
          "Su valor mínimo es: ", stats_price_final$min, "\n",
          "Su valor máximo es: ", stats_price_final$max))

# Estadísticas para 'price_original'
summary(bd_games$price_original)

stats_price_original <- list(
  mean = mean(bd_games$price_original),
  mode = Mode(bd_games$price_original),
  max = max(bd_games$price_original),
  min = min(bd_games$price_original)
)

cat(paste("Para la columna x:\n", 
          "Su media es: ", stats_price_original$mean, "\n",
          "Su moda es: ", stats_price_original$mode[1], "\n",
          "Su valor mínimo es: ", stats_price_original$min, "\n",
          "Su valor máximo es: ", stats_price_original$max))

# Estadísticas para 'discount'
summary(bd_games$discount) 

stats_discount <- list(
  mean = mean(bd_games$discount),
  mode = Mode(bd_games$discount),
  max = max(bd_games$discount),
  min = min(bd_games$discount)
)

cat(paste("Para la columna x:\n", 
          "Su media es: ", stats_discount$mean, "\n",
          "Su moda es: ", stats_discount$mode[1], "\n",
          "Su valor mínimo es: ", stats_discount$min, "\n",
          "Su valor máximo es: ", stats_discount$max))

# 7. Crear un dataFrame de 13 col con la base de datos y guardar en una nueva variable

df_pruebas <- bd_games

# Filtrar el data frame por las filas que contengan "abc" en la columna "letras"
# df_filtrado_portal <- subset(bd_games, grepl("Tunche", title))
