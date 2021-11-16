##### Introducción #####

#El proyecto se basa en crear un modelo predictivo(idea inicial) usando condicionales 
#if e if else y modelos de markov para el calculo de probabilidades de selección de 
#sitio de defensa en un mapa del videojuego "Rainbow six seige"


#El juego consta de dos tipos de modalidades atacar y defender, divido en dos equipos,
# donde cada uno juega un rol, defender o atacar, cada equipo consta de 5 miembros, 
#donde seleccionaran uno de los distintos operadores en el juego con habilidades unicas
#

#El juego consta de rondas para desarmar bombas en 13 mapas diferentes, cada mapa posee
# distintos sitios donde se ubicaran las bombas, por ejemplo, un mapa es una casa, 
#las posbles ubicaciones son, el sotano, la recamara principal y una pequeña, las dos recamaras 
#pequeñas y el salon de juegos, dando como resultado 4 posibles ubicaciones para defender las bombas
# la ubicación donde se defenderan se decide en base a votaciones por los 5 miembros del equipo defensor en turno.

#Si el equipo defensor gana en la ubicación inicial, esta quedara bloqueada, por lo que solo le quedaran como opciones las otras 
#3.

#Por este motivo hay 16 posibles estados independientemente de que equipo empiece, donde el 1 representa victoria y 0 derrota

# debido a que el objetivo principal es ganar 4 de 6 rondas se limita a 4 transiciones, debido a que en la tercera ronda se cambia, el 
# rol del juego.



################ Posibles estados del modelo ####################


combinaciones <- read.csv("Datos/Posibles_combinaciones - Hoja 1 (1).csv")


combinaciones



#Durante el dearrollo del proyecto me di cuenta que la unica combinación posible que puede cumplir las condiciones para encajar,
#en un modelo de Markov es el 0 0 0 0, por que al no bloquear las tranciciones entre sitios, es posible intercambiar entre todos los
# estados incluyendo el mismo inicial (AA) por ejemplo, debido a que en los otros se bloquean las tranciciones


#Para la realización del proyecto se uso el mapa "Chalet"

# El mapa tiene 4 zonas distintas 

# 1 Sotano = Sotano 
# 2 Planta alta = Alta
# 3 Primera planta (Cocina)  = Cocina
# 4 Primera planta (Sala del billar) = Billar 



#Cargamos la base de datos que contiene las frecuencias de las localizaciones de plantación de bomba 



chalet <- read.csv("Datos/Chalet - Hoja 1.csv")

chalet



####### Para obtener las frecuencias de la ubicación de las bombas utilizamos la terminal para poder con grep -c

#contar la frecuencia de estas

#Creamos un vector que contendra las frecuencias de cada posible evento, por lo tanto son 8 posiblilidades

### SG,CG,PG,BG SL, CL, PL y BL 

frecuencias <- c(42,34,36,28,22,20,30,11)


#Podemos nombrar al vector con su respectivo, nombre


sitios <- c("SG","CG","PG","BG","SL","CL","PL","BL")


#Nombrado el vector es mucho más sencillo ,anipular y entender los datos 
names(frecuencias) <- sitios

frecuencias# El vector frecuencias, contiene un total de 



frecuencias_G <-frecuencias[1:4] 

frecuencias_L <- frecuencias[5:8]


#Obtendremos dos vectores uno que contenga las frecuencias de sitios y que haya resultado en victoria
# Y otro donde el resultado de jugar ahí sea derrota

frecuencias_G

frecuencias_L


##### Ahora debemos ver las posibles combinacioes y transciones que puede tener el sitema 



transcicion <- read.csv("Datos/Posibles transisiones - Hoja 1 (2).csv", header = T)

transcicion
 
#Esto hace posible 64 combinaciones posibles, de cambios de estado, muchos valores tienen 0 debido a que bajo las condiciones
#del sistema no es posible que ese estado exista y en la parte de las rondas perdidas y sus respectivas tranciciones, solo
#se toman en cuenta las transciciones a rondas ganadas debido a que el objetivo de este modelo es predecir situaciones favorables




fretra <- read.csv("Datos/Frecuencia de transcicion  - Hoja 1.csv")

fretra


#Por lo cual hemos cargado la frecuencia de pares para cada estado 64 en total, al igual que las frecuencias individuales 
# estas se calcularon en la terminal y se pusieron manualmente, 
 
pares_frecuencias<- c(0,3,18,6,0,4,15,0,5,0,2,6,1,0,10,0,5,9,0,7,2,9,0,3,5,2,3,0,0,1,4,0,6,3,2,0,0,0,0,0,2,1,2,0,0,0,0,0,6,2,8,3,0,0,0,0,1,0,0,1,0,0,0,0)


 
pares_frecuencias_M<- matrix(c(0,3,18,6,0,4,15,0,5,0,2,6,1,0,10,0,5,9,0,7,2,9,0,3,5,2,3,0,0,1,4,0,6,3,2,0,0,0,0,0,2,1,2,0,0,0,0,0,6,2,8,3,0,0,0,0,1,0,0,1,0,0,0,0),nrow = 8, ncol = 8 )
 

j <- percentum_vector(pares_frecuencias_M)

i <- percentum_vector(frecuencias)


j/i

j

j[,1]/2









