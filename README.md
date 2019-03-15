# Realización de un filtro adaptativo para el filtrado de voz en sistemas de vuelo

En este proyecto se pretende realizar un filtro digital adaptativo usando el algoritmo LMS para el filtrado de la voz en el contexto de una gran cantidad de ruido proveniente del ruido de los motores del sistema de vuelo.

En el fichero lms.m se incluye la función del filtro. En los ficheros de prueba.m y pruebalms.m se realizan algunas pruebas numéricas sobre el filtro implementado. En el fichero cancelacion.m se realiza una desmostración del uso del filtro utilizando los archivos RUIDO1.mat y VOZ_RUIDO.mat, que representan las señales de entrada.


En la idea original, se pensaba en un piloto en cuyo casco hay dos micrófonos: Uno por el que habla con la estación (genera la señal VOZ_RUIDO.mat); otro  micrófono situado en la parte trasera del casco cuyo objetivo es grabar el ruido de los motores para dar la realimentación al filtro adaptativo.
