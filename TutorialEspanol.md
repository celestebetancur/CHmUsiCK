# El tutorial de CHmUsiCK

CHmUsiCK es una colección de clases y herramientas para expandir chucK, 
haciendolo mas flexifle y rápido al momento de hacer codigo en vivo y
sobretodo música, que pueda ser bailable y bailada. 

La idea general esta inspirada en varias fuentes, una de ellas es Tidal
- un minilenguage para hacer beats escrito en Haskell - como inspirador 
de los beats, los ciclos y en general las funciones que transforman patrones.

Es recomendable saber un poco de programación, y todo será más rápido si
ya conoce la sintaxis de chucK pero si lo que quiere es hacer música 
bailable con codigos, y nunca ha programado, no se preocupe, CHmUsiCK 
una gran herramienta para iniciar, asi que manos al teclado.

### Instalación

Antes que nada debe instalar chucK en su computador:
<a ref="http://chuck.cs.princeton.edu/release/"> chucK </a>
lo segundo es descargar CHmUsiCK:
<a ref="https://github.com/essteban/CHmUsiCK"> CHmUsiCK </a>

### Primeros beats

(Puede usar cualquier editor de texto para escribir todo que le pediremos
que escriba de ahora en adelante, se recomienda usar Emacs o miniAudicle)

Dentro de la carpeta de CHmUsiCK hay un archivo llamado LiveCode.ck (es ahí
donde debe escribir todo lo que se le pida que escriba), abralo y escriba 
lo siguiente:

```c++
Drum miBateria => dac;
miBateria.drum(miBateria.every(4));
minute => now;
```

Guardelo, el siguiente paso es lanzar CHmUsiCK, lo que se hace abriendo 
Library.ck y añadiendolo a la maquina virtual...

¡Ahí tiene el primer beat!

En el ejemplo anterior la función ```drum()``` hace un llamado a la maquina 
de ritmo y ```every()``` llama un sonido -bombo- cada 4 eventos del ciclo.

Los eventos en un ciclo estan determinados por un número que es único en 
CHmUsiCK, y que está en la clase principal:

```c++
Chmusick miTiempo;

Drum miBateria => dac;

130 => miTiempo.tempo;

spork~miBateria.drum(miBateria.every(4),miBateria.rotate(miBateria.every(4),2),miBateria.every(1));
//spork~miBateria.drum([1,0,0,0],[0,0,1,0],[1,1,1,]); 

minute => now;
```

En este código está resumida la sintaxis de CHmUsiCK, así que nos detendremos
un momento para enterdelo muy bien:

```Chmusick miTiempo;``` crea un objeto de la clase principal para poder cambiar
el bpm (beats per minute), la segunda linea conecta la maquina de ritmo ```Drum```
al dac, que es la salida de audio.

```130 => miTiempo.tempo``` cambia el tiempo general, que por defecto es 120 bpm 
a 130 bpm.

En la cuarta linea añadimos la palabra ```spork~```que es la forma de decirle 
a chucK que queremos que ejecute la linea en comcurrencia (ya entenderemos esto), y 
tenemos varios llamados a funciones, algunos que ya hemos explicado y la nueva
función ```rotate()``` que desplaza en este caso 2 posiciones el resultado de
```every(4)``` .

La quinta linea empieza con ```//``` lo que la hace un comentario, esta linea
no es ejecutada por la maquina virtual, pero muestra una forma alternativa de
escribir el mismo ritmo... ¿Que tal si comenta la linea cuatro y descomenta la
cinco, y luego guarda el archivo? el sonido no cambiará nada, parece mas comodo
pero para ritmos mas complejos, las funciones serán indispensables.

Eso es todo... de verdad, la sintaxis general de CHmUsiCK no tiene nada mas que 
aprender; ahora todo es cuestión de descubrir otros tipos de  UGen (generadores de 
audio) y las funciones para modificar sus parámetros, así que si el ejemplo 
anterior le parecio complejo debe darnos otra oportunidad para entender la 
ciencia del beat.

## Clases 

En este punto ya hicimos llamados a clases, al hacer ```Chmusick miTiempo;```
y ```Drum miBateria;``` estamos creando objetos de estas clases con un nombre
para identificarlos, y es a travez de estos objetos que podemos usar los metodos
que nos permiten jugar con beats.

### Chmusick

TEMPO es un miembro de esta clase que controla el tempo general de los ciclos.
Por defecto es 120 bpm.

CYCLES es otro miembro de esta clase, determina el número de ciclos antes de 
relanzar el codigo.

MEASURE determina el número de beats por ciclo; con estos tres miembros de la clase
principal se controla todo el envio del codigo a la Maquina virtual de chucK.

#### Métodos de la clase principal Chmusick

#### Arrays de 0 y 1

Todos los objetos, pueden usar los métodos de esta clase:

Random ```rand()```

Esta función recibe un  int como parametro, y retorna un array de tamaño ```int``` 
lleno de 0 o 1 distribuidos de manera aleatoria.

Trunc ```trunc()```

Trunca un array usando un ```float``` como porcentaje de 0 a 1.

Esta función tambien recibe dos ```int``` para cortar el array desde el primer parámetro
hasta el segundo.

Reverse ```reverse()``` 

Retorna el array invertido.

Densify ```densify()```

Pone 1 aleatoriamente donde encuentra 0.

Degrade ```degrade()```

Cambia 1 por 0 aleatoriamente.

Every ```every()```

Retorna un array con 1 en la primera posición y 0 el resto de la capacidad.

Esta funcion tambien recibe un parámetro ```ínt``` para ser puesto en la primera
posición en vez de 1.

Rotate ```rotate()```

Sin argumentos desplaza a la derecha una posición en un array.

En general, desplaza ```ínt``` posiciones a la derecha el array.

Counter ```counter()```

Retorna la cantidad de elementos diferentes a 0.

Density ```density()```

Usa un parametro ```float``` para hacer ```densify()``` ó ```degrade()``` 
según el conteo de eventos diferentes a 0 en un array.

Paindrome ```palindrome()```

Retorna el array mas una copia de si mismo reversado al final.

### Drum

```c++
Chmusick miTiempo;

Drum miBateria => dac;

spork~miBateria.drumF(miBateria.favorite(0));

day => now;
``` 

El metodo principal de la clase ```Drum``` es ```drum()``` que reproduce un máximo
de tres tipos diferentes de audio, en este caso: bombo, redoblante y platillos, 
escritos como eventos que se encienden y de apagan representados por ```0``` y
```1```, este metodo tiene un hermano que refresca el ritmo cada cierto número 
de repeticiones del ciclo, ```drumF()``` lo hace por defecto cada octava repetición
pero es posible cambiar esto, añadiendo:

```c++
3 => miBateria.fillEach;
```

En el ejemplo anterior tambien vimos el motodo ```favorite()``` que extrae unos 
ritmos pre-escritos.

#### Métodos de la clase Drum

```bdSound(), snSound(), hhSound()```

Cambian el sample que ejecuta la función ```drum()```.

Fill Each ```fillEach()```

Determina el momento de refrescar el ritmo de ```drumF()```.

Favorite ```favorite()```

Extrae los ritmos pre escritos del archivo FavoriteArray.ck

RandomDrum ```randomDrum()```

Lanza la función ```drum()``` con arrays aleatorios, puede recibir un ```ínt```
para determinar el número de eventos.

Single func ```bd([]) , bd(), sn([]), sn(), hh([]), hh()```

Estas funciones trabajan en parejas, son otra forma de implementar ```drum()```
pero de manera independiente.

### Melody, FMSynth y TheCooker

#### Métodos para clases Melódicas



### Harmony y Notes

#### Métodos de la clase Harmony y el nucleo musical Notes 

### Audio, Pan, EFX

### Rec

### Tools
