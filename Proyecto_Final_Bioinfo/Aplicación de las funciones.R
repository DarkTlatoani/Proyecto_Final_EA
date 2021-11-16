####### percentum_vector ######

#Esta fue la función más importante para el desarrollo del proyecto, ya que al facilitar 
#Tareas como el calculo del porcentaje de las frecuencias y ademas la fracción que da
# cada elemento del vector independientemente de que tan largo sea el vector


#### Cree algunos ejemplos que pueden ayudar a entender mejor la función 


manzanas <- c(40,75,89,09)
#Creamos un vector que contenga números

# nombres 

colores<- c("Rojas", "Verdes", "Amarillas","Doradas")


#Le asignamos nombres para que al momento de leerlo sea más sencillo 

names(manzanas) <- colores


#Corremos la función y nos arroja un vector que nos da el porcentaje, de cada elemento en el total del vector

## Parecido a lo que hacía biostrings con nucleotide frecuency, solo que le faltaría encontrar el patrón 

percentum_vector(manzanas)


####### FUNCIONES PARA MARKOV #####


# Las funciones creadas en el proyecto para agilizar el calculo de las cadenas deMarkov
#resultaron un tanto improductivas ya que la función principal de Markov no se logro
# y se tuvo que trabajar con sitioxsitio que es hacerlo en base a vectores y no a una matriz
# completa

#Sitioxsitio cumple con su función de calcular las probabilidades de trancición por lo
#lo que la idea solo sería aumentarle o modificar algo para que la de Markov funcione

#Y esta función ademas requiere de percentumvector para poder funcionar 





############ R 6 S ################

#Tenemos a las dos funciones que operan con uso tambien de percentumvector 


Ronda_1()# Ronda 1 te dice cual es tu oportunidad de ganar en base a la localización inicial que escojas

#Tomando en cuenta todos los posibles escenarios


Ronda_2()#La idea es que en base a según como te fue en la partida tomando en cuenta tu estado inicial, 
# En base a las tranciciones de Markov tu puedas saber cual es el mejor sitio siguiente segun hayas ganado o perdidi










