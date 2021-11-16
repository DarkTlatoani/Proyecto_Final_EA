

##################### Suma de elementos de vector  ########################################

#Tome esta función de la clase para poder conocer la suma total de los elementos, pero ademas tiene una agregación interesante
# Y es que te permite conocer a que fracción equivale cada elemento del vector en porcentaje y te regresa ese vector 

percentum_vector <- function(x){
  
  suma=0
  for(a in x ){
    suma <- suma + a
    
  }
      c <-length(x) 
      b <-c(1:c)
      b <- b/b
      
      suma <- b*suma
      
      porcentajes <-  (x*100)/suma 
      
      return(porcentajes)
     
       }




############## Pruebas de percentumvector ##########################################

#Esta función es util para vectores con datos ordenados y agrupados adecuadamente en frecuencias por ejemplo
# Supongamos que tenemos un vector, independientemente de que tan grande  sea tu vector


manzanas


color <- c("Rojas", "Amarillas", "Verdes")


names(manzanas) <- color

manzanas

percentum_vector(manzanas)

# En este script de R pondre todo el codigo de la función que se creara para la predicción de la partida


#La función se llama Chalet debido a que es el nombre del mapa en el que estan basados los datos capturados,

#La idea es que con una sola función te de cada dato de la partida y que la puedas usar para poder escoger y predecir el 

# sitio más probable para el nido de bombas 





###############   RONDA 1 ##############################################################################
Ronda_1 <- function(){
  
  l <- readline(prompt = "1= Sotano , 2= Cocina  , 3=Planta alta  y 4= Billar   
                
                ¿Dónde estas?")
  
  l <- as.numeric(l)
  
  
  return(if(l==4 ){print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias_G)[4],"%" ))
    }else if(l == 3 )
  {print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias_G)[3],"%"))}else if(l == 2)
  {print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias_G)[2],"%"))}else{print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias_G)[1],"%"))})
  
  
  
}

#La versión final es esta debido a que contempla las frecuencias de todos los estados


Ronda_1 <- function(){
  
  l <- readline(prompt = "1= Sotano , 2= Cocina  , 3=Planta alta  y 4= Billar   
                
                ¿Dónde estas?")
  
  l <- as.numeric(l)
  
  
  return(if(l==4 )
  {print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias)[4],"%" ))}else if(l == 3 )
  {print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias)[3],"%"))}else if(l == 2)
  {print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias)[2],"%"))}else{print(paste("Tu probabilidad de ganar es de",percentum_vector(frecuencias)[1],"%"))})
  
  
  
}







Ronda_1()









########## MATRIZ DE MARKOV  ##################



#Para esta parte y teniendo en cuenta que la idea del proyecto es calcular las tranciciones más efectivas

# Se creo una función para generar una matriz de markov




#Nuestros valores seran x y y donde x es un vector que contiene la frecuencia de los eventos
# y y la frecuencia de que sucedan uno despues del otro 

# Todo parte de la formula de bayes, la cual nos permite conocer la probabilidad de dado que sucedio A ocurra B



#Para poder realizar esta función usaremos la que se creo en este trabajo en primera instancia 




Markov_matrix <- function(x,y){
  
  
  x<- percentum_vector(x)
  y<- percentum_vector(y)
  
  a <- length(x)
  b <- c(1:a)
  b <- as.numeric(b)
  
  m <- 0
  
  v <- c()
  
  for(n in b){
    
   y <- y[,m+b]/x
    
    
    v <- c(y)
    
    
    
  }
  
  
  
  v<- as.matrix(v, nrow = 8, ncol= 8)
  
  return(v)
  
}


Markov_matrix(frecuencias,pares_frecuencias_M)







#################   Obtener frecuencias #########################

#### Debido a que no salio(Aun) la función de Markov Matrix usaremos una dunción equivalente 


     sitioxsitio <- function(x,y){
       
       x<- percentum_vector(x)
       y <- percentum_vector(y)
       
       
       a <- y/x
       
       a <- a*a 
       
       names(a) <- sitios
       
       max(a)
      
      return(a[1:4])
}

  


frecuencias

SG <- pares_frecuencias[1:8]


names(SG) <- sitios

SG


sitioxsitio(frecuencias,SG)

percentum_vector(frecuencias)

### De una manera poco eficiente y sin poder hacerlo en un solo movimiento, dividiremos el vector que contiene las frecuencias de pares 

#de modo que tendremos 8 vectores 


SG
CG <- pares_frecuencias[9:16]
PG <- pares_frecuencias[17:24]
BG <- pares_frecuencias[25:32]
SL <- pares_frecuencias[33:40] 
CL <- pares_frecuencias[41:48]
PL <- pares_frecuencias[49:56]
BL <- pares_frecuencias[57:64]

################ Función predictiva ##########################

Ronda_2 <- function(){
  
  a <- readline( prompt = "¿Dónde fue tu ronda anterior?
                 
                 
                 
  1= Sotano , 2= Cocina  , 3= Planta alta  y 4= Billar" )
  
  a <- as.numeric(a)
  
  b <- readline(prompt = "¿La ganaste?, 1= Si , 2 = No")
  
  b <- as.numeric(b)
  
  c <- a*b*b*b 
  
  return(if(c==1 )
  {print(paste("Dado que ganaste en Sotano, la mejor probabilidad de volver a ganar es de",max(sitioxsitio(frecuencias,SG)),"% en Planta alta"  
  ))}else if(c == 2)
  {print(paste("Dado que ganaste en Cocina, la mejor probabilidad de volver a ganar es de",max(sitioxsitio(frecuencias,CG)),"% en Billar"  
  ))}else if(c == 3)
  {print(paste("Dado que ganaste en Planta alta, la mejor probabilidad de volver a ganar es de",max(sitioxsitio(frecuencias,PG)),"% en Cocina"  
  ))}
  else if(c == 4  )
  {print(paste("Dado que ganaste en Billar, la mejor probabilidad de volver a ganar es de",max(sitioxsitio(frecuencias,BG)),"% en Sotano"  
  ))}
  else if(c == 8  )
  {print(paste("Dado que perdiste en Sotano, la mejor probabilidad de ganar es de",max(sitioxsitio(frecuencias,BL)),"% en Sotano"  
  ))}
  else if(c == 16 )
  {print(paste("Dado que perdiste en Cocina, la mejor probabilidad de ganar es de",max(sitioxsitio(frecuencias,PL)),"% en Planta alta"  
  ))}
  else if(c == 24 )
  {print(paste("Dado que perdiste en Planta alta, la mejor probabilidad de ganar es de",max(sitioxsitio(frecuencias,BL)),"% en Planta alta "  
  ))}
else{print(paste("Dado que perdiste en Billar, la mejor probabilidad de ganar es de",max(sitioxsitio(frecuencias,BL)),"% en Billar"  
))})
  
  
  
  
  
}
