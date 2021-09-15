# Escaner de puertos
_Script que hace un scaneo de puertos usando solamente comandos de linux_
## Preparacion
_Hacer un reconocimiento de puertos usando nmap es muy efectivo. Pero no 
siempre contaremos con esa herramienta, Asi que hoy vamos a crear un pequeño
script que haga la misma funcion._
## Instalacion
_Lo bueno de hacer un script usando bash es que no necesitas instalar nada
todo ya viene por defecto en el sistema **Kali Linux**._

### Encabezado de script
_El encabezado o conocido tambien como shebang es una linea de codigo que hace
referencia a la aplicacion que va ejecutar nuestro script._

```bash
#!/bin/bash
```
_Este es lo basico para empezar a escribir nuestros scripts en bash._

### Usando un Bucle

La idea es comenzar a recorrer los 65535 puertos que existen usando la funcion **seq** junto con un bucle **for**
```bash
for port in $(seq 1 65535); do
    timeout 1 bash -c "echo '' > /dev/tcp/<IP>/<PORT>" &
    
    if [ $(echo $?) -eq 0 ]; then
        echo -e "\n\[*\] Puerto $port abierto"
    fi
done
```
Con este sencillo bloque de codigo en bash es que logramos obtener los
puertos abiertos de un host.

## Ahora a practicar un poco con los enlaces.

[Aqui va un Enlace](https://gist.githubusercontent.com/Villanuevand/6386899f70346d4580c723232524d35a/raw/2257b97cb7bd8de0906fa8fcde3a92f8dcb984e0/README-espa%25C3%25B1ol.md) _Que va directamente al repositorio de alguien que tiene muestras
de como usar el lenguaje de marcado o marcas._

## Ahora a empezar a usar listas.

### Listas Ordenadas
**Lenguajes de Programacion:**
1. Python
2. Java
3. Javascript
4. C#

### Listas No Ordenadas
**Componentes de una computadora:**
- CPU
    1. Disco Duro
    2. Memoria Ram
    3. Procesador
    4. Targeta de video
- Monitor
- Teclado
- Mouse
- *Esto va en Italica*
- _Aunque igual funciona con guion bajo y asterisco_

## Agregando imagenes
![Aqui va una Imagen](image.jpg)

> "Nunca digas nunca, nunca digas siempre, solo di que quieres
   aprender como nunca y para siempre."

-------------------------------------------------------------------------------

## Creando una tabla.

| id | user | password |
| --- | ------------------ | ---------- |
| 1 | Noelia | S3cre7 | 
| 2 | Steffie | Ch4nd3lieR | 
| 3 | Belen | Em0t1kon0 | 

## Usando un Strikethrough
~~AQUI VA UN EJEMPLO DE ESO lo que sea que sea.~~

## Usando una lista de tareas.
- [x] Despertarse temprano.
- [ ] Desayunar un buen desayuno.
- [ ] Ponerse a estudiar.
- [ ] Almorzar.
- [ ] Seguir estudiando.

### My great Heading {#custom-id}

<<<<<<< HEAD
_Y bueno fuchachos aqui termina este **tutorial**_
=======
_Y bueno fuchachos aqui termina este tutorial

## Usando pies de pagina
Aqui hay una oracion con un pie de pagina.
[^1]

[^1]: Esta es pie de pagina o texto al final de una nota.

>>>>>>> translate
