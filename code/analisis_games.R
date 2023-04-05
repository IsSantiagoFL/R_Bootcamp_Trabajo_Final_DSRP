################################################################################
# Script: analisis.R
# Autor: Santiago Ismael Flores Chávez
# Fecha de creación: 3 de abril de 2023
# Descripción: ...

################################################################################

# Instalar las librerías necesarias

# Para hallar la 'moda' de un vector numérico
install.packages("DescTools")

# Para importar archivos desde Excel
install.packages("readxl")

# Para generar graricos profesionales
install.packages("ggplot2")


# Carga de librerías necesarias

library(DescTools)
library(readxl)
library(ggplot2)


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

# 8, 9 y 10. Agregar una columna de "1" y una fila de un Juego nuevo.
df_pruebas$col1 <- 1 
data_new_game <- data.frame(app_id = 000000, 
                            title = "Nuevo Juego", 
                            date_release = "2023-04-03", 
                            win = "false", 
                            mac = "false", 
                            linux = "true", 
                            rating = "Very Positive", 
                            positive_ratio = 100, 
                            user_reviews = 40000, 
                            price_final = 0.00, 
                            price_original = 0.00, 
                            discount = 0, 
                            steam_deck = "true", 
                            col1 = 1)

df_pruebas <- rbind(df_pruebas, data_new_game)

# 11. Eliminar filas y columnas de la matriz

# Elimar la columna 'app_id'
df_pruebas <- subset(df_pruebas, select = -app_id)

# Eliminar filas: eliminar los juegos que no esten disponibles para Linux:
df_pruebas <- subset(df_pruebas, linux != "false")

# 12. Seleccionar los elementos de la matriz
df_pruebas <- subset(df_pruebas, price_final < 10.01, select = -linux)

df_pruebas <- df_pruebas[df_pruebas$positive_ratio > 95 & df_pruebas$user_reviews > 10000, ]

# 13 - 16. cambinar de nombre al data frame

df_mejores_juegos_linux <- df_pruebas 

################################################################################

### P2. Importar Datos

# 1. Importar Datos desde Excel y Ordenar los datos con la función order(), de preferencia para la variable Price_final

data <- read_excel("data/games_excel.xlsx")

# corrigiendo los datos de precio orginal y precio final

data$price_original <- data$price_original / 100 
data$price_final <- data$price_final / 100

# Ordenando los datos por precio final

data_ordenada <- data[order(data$price_final, decreasing = TRUE), ]

# 2. Mostrar el dataframe ordenado de manera ascendente y descendente

# ascendente
data_ordenada <- data[order(data$price_final, decreasing = FALSE), ]

# descendente
data_ordenada <- data[order(data$price_final, decreasing = TRUE), ]

# 3. Calcular el resumen estadístico de los datos con la función que corresponde

summary(data$price_final)
Mode(data$price_final)

# 4. realizar las graficas

#Histograma
# Un histograma es una representación gráfica de la distribución de frecuencia de 
# una variable numérica. Para crear un histograma en R, podemos utilizar la 
# función ggplot() del paquete ggplot2:
  
ggplot(data, aes(x = price_final)) + 
  geom_histogram(binwidth = 2, fill = "#2c3e50", color = "white") +
  labs(x = "Precio final", y = "Frecuencia", title = "Histograma de precios finales")

# En este ejemplo, hemos especificado que el eje X represente los valores de la 
# columna price_final, y hemos agregado capas de estilo para definir el ancho de 
# los bines y los colores de relleno y de borde.

# Boxplot
# Un boxplot (o diagrama de caja y bigotes) es un gráfico que muestra la 
# distribución de los datos en un conjunto de valores numéricos. Los valores 
# atípicos son representados como puntos individuales. Para crear un boxplot en R, 
# podemos utilizar la función ggplot() junto con geom_boxplot():
  
ggplot(data, aes(y = price_final)) + 
  geom_boxplot(fill = "#2c3e50", color = "white", outlier.color = "#e74c3c") +
  labs(y = "Precio final", title = "Boxplot de precios finales")

# En este ejemplo, hemos especificado que el eje Y represente los valores de la 
# columna price_final, y hemos agregado capas de estilo para definir los colores 
# de relleno, de borde y de los puntos atípicos.

#Gráfico de densidad
# Un gráfico de densidad es una representación gráfica de la distribución de 
# probabilidad de una variable numérica continua. Para crear un gráfico de densidad
# en R, podemos utilizar la función ggplot() junto con geom_density():

ggplot(data, aes(x = price_final)) + 
  geom_density(fill = "#2c3e50", color = "white") +
  labs(x = "Precio final", y = "Densidad", title = "Gráfico de densidad de precios finales")

# En este ejemplo, hemos especificado que el eje X represente los valores de la 
# columna price_final, y hemos agregado capas de estilo para definir los colores 
# de relleno y de borde.

#Gráfico de violín
# Un gráfico de violín es una combinación entre un boxplot y un gráfico de 
# densidad. Para crear un gráfico de violín en R, podemos utilizar la función 
# ggplot() junto con geom_violin():
  
ggplot(data, aes(x = "", y = price_final)) + 
  geom_violin(fill = "#2c3e50", color = "white", alpha = 0.8) +
  geom_boxplot(width = 0.1, fill = "#e74c3c", alpha = 0.4) +
  labs(x = "", y = "Precio final", title = "Gráfico de violín de precios finales")

# En este ejemplo, hemos especificado que el eje X no tenga etiquetas, y hemos 
# agregado capas de estilo para definir los colores





