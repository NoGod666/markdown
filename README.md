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
