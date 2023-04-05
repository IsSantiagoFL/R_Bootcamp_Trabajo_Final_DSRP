################################################################################
# Script: Parte3.R
# Autor: Santiago Ismael Flores Chávez
# Fecha de creación: 3 de abril de 2023
# Descripción: Parte 3 del documento de finalización del rpograma bootcamp R
# https://github.com/IsSantiagoFL/R_Bootcamp_Trabajo_Final_DSRP


################################################################################

#### P3. Programación
# 1. Implementar una función para la multiplicación de dos vectores(xy) y probar con valores

# Definir la función para multiplicar dos vectores
multiplicar_vectores <- function(x, y) {
  if (length(x) != length(y)) {
    stop("Los vectores deben tener la misma longitud")
  }
  resultado <- x * y
  return(resultado)
}

# Ejemplo de uso de la función
x <- c(1, 2, 3)
y <- c(4, 5, 6)
resultado <- multiplicar_vectores(x, y)
print(resultado)


# 2. Implementar una función que muestre el resultado de la ecuación de Bhaskara y probar con valores.

# Definir la función para calcular las raíces de una ecuación de segundo grado
bhaskara <- function(a, b, c) {
  
  # Calcular el discriminante
  d <- b^2 - 4*a*c
  
  # Verificar si la ecuación tiene solución real
  if(d < 0) {
    cat("La ecuación no tiene solución real.")
    return(NULL)
  }
  
  # Calcular las raíces
  x1 <- (-b + sqrt(d)) / (2*a)
  x2 <- (-b - sqrt(d)) / (2*a)
  
  # Mostrar las raíces
  cat("Las raíces son:", x1, "y", x2)
  
}

# Probar la función con valores
bhaskara(1, -5, 6)

# 3. Se quiere conocer la media muestral de n observaciones obtenidas independientemente de una distribución normal con media = 0 y varianza =1.

media_muestral <- function(n){
  muestras <- rnorm(n, 0, 1)
  media <- mean(muestras)
  return(media)
}


# 3.1. Realizar una simulación, luego calcular las estadísticas descriptivas aplicando la función que corresponde y graficar.

# Definir el tamaño de la muestra
n <- 100

# Generar una muestra aleatoria de n observaciones a partir de una distribución normal con media 0 y varianza 1
muestra <- rnorm(n, mean = 0, sd = 1)

# Calcular la media muestral de la muestra
media_muestral <- mean(muestra)

# Calcular la desviación estándar muestral de la muestra
sd_muestral <- sd(muestra)

# Calcular los cuartiles de la muestra
cuartiles <- quantile(muestra, probs = c(0.25, 0.5, 0.75))

# Graficar la distribución de la muestra

hist(muestra, breaks = "Sturges", col = "blue", xlab = "Valores", ylab = "Frecuencia", main = "Distribución de la muestra")
abline(v = media_muestral, col = "red", lwd = 2)

# Imprimir las estadísticas descriptivas de la muestra
cat("Media muestral:", media_muestral, "\n")
cat("Desviación estándar muestral:", sd_muestral, "\n")
cat("Cuartiles:", cuartiles, "\n")
