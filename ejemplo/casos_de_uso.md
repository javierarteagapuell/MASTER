# Casos de Uso del IPF

El método *Iterative Proportional Fitting* (IPF) se emplea en numerosos ámbitos donde es necesario ajustar tablas de datos multidimensionales para que cumplan con ciertos márgenes o restricciones conocidas. Su capacidad de combinar información parcial de diferentes fuentes lo convierte en una herramienta versátil en tareas de análisis y modelado de datos.

## Demografía y Estadísticas Sociales

En estudios estadísticos, el IPF se utiliza para ajustar tablas de contingencia procedentes de encuestas, de manera que las distribuciones marginales por edad, género o región coincidan con los datos censales oficiales. Esto permite obtener estimaciones consistentes con la estructura real de la población.

**Ejemplo:**  
Si una encuesta registra por separado la proporción de hombres y mujeres y la proporción por grupos de edad, pero no el cruce concreto (hombres jóvenes, mujeres mayores, etc.), el IPF reconstruye esa tabla de doble entrada conservando ambos márgenes conocidos.

## Modelado de Transporte

En movilidad urbana, el IPF calibra matrices origen-destino para que el número total de viajes que parten y llegan a cada zona encaje con los datos de conteos o encuestas.

**Ejemplo:**  
En una ciudad con tres zonas, se conoce el total de viajes que salen y llegan a cada zona, pero no cómo se distribuyen entre ellas. El IPF ajusta una matriz inicial estimada hasta que las sumas por fila y columna coincidan con esos totales, obteniendo así una matriz origen-destino calibrada y coherente con los datos reales.

## Modelado Energético

Permite desagregar el consumo energético total en sectores (residencial, comercial, industrial) y zonas geográficas, alineando las estimaciones con los márgenes agregados de consumo registrados por subestaciones.

**Ejemplo:**  
Si sabes que el 50 % del consumo es residencial, el 30 % comercial y el 20 % industrial a nivel municipal, y además conoces el consumo total medido por distrito, el IPF distribuye ese consumo por sector y por zona de forma coherente con ambos conjuntos de márgenes.
