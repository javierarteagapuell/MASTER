## Ejemplo de Tabla de Contingencia

Una tabla de contingencia [1] es una representación tabular que muestra la frecuencia conjunta de dos variables categóricas. Cada celda indica el número de hogares que pertenecen simultáneamente a una categoría de cada variable, mientras que las sumas por fila y columna representan los márgenes totales.

Por ejemplo, el siguiente cuadro relaciona el número de vehículos por hogar con el tamaño del hogar:

| Nº Vehículos / Hogar | Pequeño | Mediano | Grande | Total |
|---------------------|---------|---------|--------|-------|
| Sin vehículo        | 12      | 15      | 30     | 57    |
| 1 vehículo          | 16      | 22      | 48     | 86    |
| 2+ vehículos        | 14      | 21      | 22     | 57    |
| **Total**           | 42      | 58      | 100    | 200   |

En este ejemplo, el objetivo del ajuste sería modificar ligeramente las celdas internas de la tabla para que coincidan con unos márgenes externos preestablecidos. En el caso multidimensional, la lógica es la misma, pero se extiende a más de dos variables (por ejemplo, tamaño del hogar, número de vehículos y salario), lo que da lugar a estructuras más complejas llamadas tensores, en lugar de matrices bidimensionales simples.

# Ejemplo Ilustrativo de Ajuste Bidimensional mediante IPF y EDA

Supongamos que deseamos ajustar la tabla anterior para cumplir con unos márgenes objetivo diferentes a los observados. Imaginemos que disponemos de datos separados sobre el número total de hogares según el tamaño del hogar y, por otro lado, el número total de hogares según el número de vehículos que poseen. El objetivo es estimar la distribución conjunta de hogares por tamaño y número de vehículos, ajustando dicha distribución para que los cumpla.

## Márgenes observados y márgenes objetivo

- **Márgenes observados de número de vehículos:** `[57, 86, 57]`, correspondientes a hogares con 0, 1 y 2 o más vehículos respectivamente.
- **Márgenes objetivo de número de vehículos:** `[27, 43, 30]`, que reflejan un pequeño ajuste para la estimación.
- **Márgenes observados de tamaño del hogar:** `[42, 58, 100]`, correspondientes a hogares con tamaño pequeño, mediano y grande respectivamente.
- **Márgenes objetivo de tamaño del hogar:** `[22, 28, 50]`, un ajuste leve similar al anterior.

## Tabla inicial con valores iguales

| Vehículos / Tamaño Hogar | Pequeño | Mediano | Grande | Total |
|--------------------------|---------|---------|--------|-------|
| Sin vehículo             | 1       | 1       | 1      | 3     |
| 1 vehículo               | 1       | 1       | 1      | 3     |
| 2+ vehículos             | 1       | 1       | 1      | 3     |
| **Total**                | 3       | 3       | 3      | 9     |

Aplicando el algoritmo **Iterative Proportional Fitting (IPF)**, ajustamos iterativamente los valores de las celdas para que los totales por fila y columna coincidan exactamente con los márgenes objetivo, manteniendo una estructura coherente con la información original.

## Tabla ajustada con IPF

| Nº Vehículos / Hogar     | Pequeño | Mediano | Grande | Total |
|-------------------------|---------|---------|--------|-------|
| Sin vehículo            | 6       | 7       | 14     | 27    |
| 1 vehículo              | 8       | 11      | 24     | 43    |
| 2+ vehículos            | 8       | 10      | 12     | 30    |
| **Total**               | 22      | 28      | 50     | 100   |

Aunque el método IPF ajusta la tabla para que cumpla perfectamente con los márgenes establecidos (es decir, las sumas por filas y columnas son correctas), no siempre ofrece resultados realistas. En otras palabras, algunas combinaciones dentro de la tabla pueden ser poco probables o alejarse demasiado de lo que esperaríamos encontrar en la realidad.

Por ejemplo, puede asignar demasiados hogares sin vehículo a hogares grandes, o distribuir los valores de forma poco natural. Esto ocurre porque IPF se enfoca solo en que las sumas cuadren, sin tener en cuenta si los números intermedios son razonables.

Para mejorar este aspecto, se aplica un refinamiento adicional con un algoritmo llamado **EDA** (por sus siglas en inglés, *Estimation of Distribution Algorithm*). Este algoritmo parte de la solución obtenida con IPF, pero la ajusta buscando que la distribución final sea más realista y coherente. Es decir, no solo se cumplen los márgenes, sino que también se obtienen combinaciones más plausibles según el contexto.

Gracias a este refinamiento, el siguiente cuadro muestra una tabla final que refleja de manera más fiel la estructura esperada en una población real, haciendo que los datos resultantes sean más útiles para el análisis o la toma de decisiones.

## Tabla ajustada con refinamiento EDA

| Nº Vehículos / Hogar     | Pequeño | Mediano | Grande | Total |
|-------------------------|---------|---------|--------|-------|
| Sin vehículo            | 6       | 7       | 14     | 27    |
| 1 vehículo              | 7       | 12      | 24     | 43    |
| 2+ vehículos            | 9       | 9       | 12     | 30    |
| **Total**               | 22      | 28      | 50     | 100   |

Después de aplicar el ajuste inicial con IPF y refinarlo mediante EDA, se ha llegado a una solución más realista. En la tabla final se observan pequeños cambios respecto a la generada solo con IPF, lo que indica que el algoritmo ha seguido optimizando la distribución para hacerla más coherente con lo que cabría esperar en la realidad.

Este procedimiento puede extenderse sin dificultad al caso tridimensional (o de orden superior), utilizando tensores en lugar de matrices, y generando un conjunto coherente de márgenes para cada dimensión. El principio es el mismo: generar valores aleatorios por dimensión, escalar y ajustar los márgenes, y construir un tensor base que respete las proporciones generales y la suma total objetivo.

