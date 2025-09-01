Este script de PowerShell está diseñado para simular actividad del usuario moviendo el cursor del mouse y enviando pulsaciones de teclas a intervalos regulares, lo que puede evitar que el equipo entre en modo inactivo o se bloquee por falta de actividad.

Primero, se definen variables para las horas, minutos, un modificador de dirección (`$PlusOrMinus`) y el intervalo de espera en segundos. Se carga la librería `System.Windows.Forms` para manipular el cursor.

El script verifica si se ha especificado una cantidad de horas o minutos distinta de cero. Si hay horas, las convierte a minutos y las suma al total. Calcula el número de iteraciones necesarias según el tiempo total y el intervalo de espera.

En el bucle principal, obtiene la posición actual del cursor y la mueve ligeramente alternando la dirección. Luego, espera el intervalo definido. El script calcula el tiempo transcurrido y lo muestra en formato de segundos, minutos o horas/minutos/segundos, según corresponda. Este texto se muestra en la consola y se envía como pulsaciones de teclas usando el objeto `Wscript.Shell`, seguido de un Enter.

Si no se especifican horas ni minutos, el script muestra un mensaje indicando que se debe agregar un valor de tiempo y termina. Así, el script solo se ejecuta si se proporciona una duración válida.
