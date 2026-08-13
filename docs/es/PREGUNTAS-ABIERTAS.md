# Preguntas abiertas

Los siete criterios de este desensamblado están cumplidos: cada byte de la
cinta tiene dueño, los cinco bloques reensamblan byte a byte, y las 335
rutinas del listado tienen escrito qué hacen y con qué evidencia. Pero eso no
lo convierte en una lista de deberes tachados: esta página cuenta con
exactitud qué significa cada cifra, y qué queda todavía por saber sobre el
juego.

## Las preguntas abiertas

La escena que cierra la zona 7 está leída byte a byte —dos sprites que bajan
y arrastran a la nave fuera de la pantalla— pero nadie ha comprobado qué
dibujan exactamente esos dos sprites. Es justo la escena que enlaza con la
segunda carga, así que merecería la pena mirarla.

Hay además 149 bytes en 0xECCC que no tienen dueño. Es un bloque escrito en
el lenguaje del intérprete de sonido, con pinta de percusión —56 llamadas a
dos frases— pero nada apunta hacia él: el valor 0xECCC no aparece ni una vez
en los tres bloques de la cinta, y ninguna frase llega tan arriba. La
historia entera, con su control, está en
[Hallazgos](HALLAZGOS.html#el-sonido-es-un-lenguaje).

El motor de sonido, por su parte, trae un modo que el juego nunca llega a
usar: el barrido de ruido puede recargarse solo al agotarse, y eso lo
enciende un bit que ninguna de las dos partituras enciende jamás. Todos los
argumentos de ese comando valen 0, 1 o 2, y nunca el 4 que haría falta.
Código muerto en las dos mitades del juego.

Y a la tabla de efectos de ruido le falta un byte, en las dos mitades, y cada
una usa justo la entrada truncada. El byte que falta se lo roba a la tabla
de notas que empieza justo ahí al lado, y sí se copia —el bucle es de seis
fijos— pero cae en un campo que nunca llega a usarse. Que el recorte sea
deliberado es lo que sugiere un detalle curioso: los cinco bytes que
sobreviven en una mitad son los mismos que la entrada completa de la otra,
como si fueran dos cortes independientes de exactamente un byte, los dos en
el único sitio inofensivo. Sugerirlo no es demostrarlo, claro.

El comando 0x84 del intérprete de sonido cuenta una duración sin reatacar la
nota, saltándose entero el tramo de ataque. Que eso sea una ligadura es la
lectura musical, y encaja con dónde aparece en la partitura, pero todavía no
está probado contra el chip como sí lo está el resto del intérprete.

Y queda una última pregunta: cuántos finales distintos hay. Se han visto los
dos —terminar el juego y quedarse sin vidas— pero nadie ha buscado si el
marcador o la puntuación cambian algo más en el remate.

Si tienes una idea sobre cualquiera de estas cosas, o te apetece mirarlo por
tu cuenta, todo lo necesario está en el repositorio: los listados, las
herramientas de medida y los ficheros de notas donde se anota cada
hallazgo.

## Qué significa ese 100 %, y qué no

El presupuesto de bytes dice:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

Y eso quiere decir una cosa muy concreta: cada byte de la cinta tiene dueño.
O es código que el trazador alcanza siguiendo el flujo de verdad, o cae
dentro de un rango declarado con un nombre y una explicación de cómo se
sabe.

Lo que no quiere decir es que se sepa para qué sirve cada byte. Un rango
puede estar acotado y medido sin estar entendido del todo, y confundir las
dos cosas sería vender humo. Hoy ningún rango de la cinta se queda sin
nombre, eso sí.

Y que ningún byte se lea como algo que no es lo vigila
`tools/check_datos_como_codigo.py`, cruzando todas las zonas declaradas
como datos contra lo que cree el trazador — corre colgado del `make sanity`
y de los tests.

## Las rutinas, contadas

Una rutina de este desensamblado pasa por tres estados, y conviene no
confundirlos: acotada, cuando el trazador sabe dónde empieza y dónde acaba;
nombrada, cuando alguien ha averiguado qué es y le ha puesto nombre; y
comentada, cuando está escrito qué hace y con qué evidencia.

El tercer estado es el que cuesta de verdad, y hoy va así:

    fase de naves    191 rutinas, 191 comentadas (100 %)
    fase de a pie    144 rutinas, 144 comentadas (100 %)
    ------------------------------------------------------
    total             335 rutinas, 335 comentadas (100 %)

O sea que quedan 0 sin comentar. La cifra la mide
`tools/rutinas_comentadas.py`, y un test la vigila para que no pueda
quedarse vieja mientras el listado sigue avanzando.

Y ese 100 % tampoco significa «terminado», igual que pasaba con el de los
bytes: quiere decir que cada rutina tiene escrito qué hace y con qué
evidencia, pero no que todo se haya comprobado en marcha con el juego
corriendo. Unas cuantas se sostienen sobre la lectura del listado, y están
marcadas como tales allí donde eso ocurre.

Cuenta como rutina una etiqueta que sea destino de al menos un `call`, o
que esté declarada como punto de entrada — los destinos de salto no
cuentan, porque casi siempre son bucles internos de otra rutina, no
cabeceras nuevas. `tools/check_interiores.py` distingue las dos cosas con
una regla sencilla: si a un punto se puede caer desde la instrucción de
arriba, no es una cabecera. Corre en el Makefile, y el test que vigila la
cifra de rutinas se apoya en él.

## Lo que el trazador no alcanza

El presupuesto mide bytes; la cobertura mide otra cosa distinta. Del código
de los dos bloques grandes, el trazador alcanza esto:

    juego de naves    23,0 %
    parte de a pie    28,6 %

El resto son datos, sí, pero también hay código al que no se llega
siguiendo el flujo: rutinas a las que solo se entra por saltos calculados,
por tablas, o por punteros que se rellenan jugando. De algunas ya se sabe
que existen porque el emulador las pilló ejecutándose; de otras, todavía no
se sabe nada.

La medida exacta de esa ceguera son los saltos indirectos: un `jp (hl)`
cuyo destino no está escrito en el binario sino en un registro, así que el
trazador se para sin más porque no tiene forma de saber a dónde va. Hay
cuatro, tres en la parte de naves y uno en la de a pie, y salen listados en
el propio trazado:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

Y los cuatro están resueltos: no queda ninguno pendiente. El de 0xE230 es
el despachador del intérprete de guiones del sonido, y su tabla de quince
punteros se lee directamente del binario. Los otros tres —0xCB99 y 0xD6B8
en la parte de naves, 0xC544 en la de a pie— se resuelven de otra manera,
jugando con el emulador delante y anotando el destino cada vez que el
salto se ejecuta, porque las estructuras que llevan esos punteros vienen a
0xFF en la cinta y se rellenan solo al jugar.

Y un quinto punto, en 0x984D, no es un salto en absoluto: es un `0xE9`
dentro de un dibujo.

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- ese E9
```

## Lo que no se ha comprobado

Sigue sin saberse cuántos finales distintos hay, como se decía arriba:
nadie ha buscado si la puntuación o el marcador cambian algo más en el
remate. El cotejo con la versión de Spectrum tampoco puede decir nada sobre
la segunda parte, porque el snapshot con el que se compara se capturó en el
menú de la primera, así que la fase de a pie del original ni siquiera está
ahí. Y que las 335 rutinas tengan comentario no significa que estén todas
comprobadas en marcha: unas cuantas se sostienen solo sobre la lectura del
listado, y donde eso pasa, queda dicho.

## Por qué se publica así

Porque un desensamblado que dice claramente dónde está cada afirmación —y de
qué clase de evidencia cuelga— es útil de verdad, mientras que uno que
aparenta saber más de lo que sabe es peor que nada: manda a quien venga
detrás a buscar en el sitio equivocado.

El criterio de toda la serie es el mismo: cada afirmación tiene que poder
contrastarse con el binario, incluidas las afirmaciones sobre lo que
todavía no se sabe. Por eso las cifras de cobertura salen siempre del
trazador, y nunca de una impresión.
