#!/bin/bash
cian="\e[96m"
yellow="\e[93m"
contador=0
function ayuda() {
	echo -e "\n\tForma de uso ${cian}\e[1m${0##/*/} [-t] <palabra a traducir>\e[0m\n"
	echo -e "\tEjemplo : ${yellow}${0##/*/} -t house\e[0m <==Una palabra en ingles o español\n"
	exit 0
}

function instalar() {
    echo -e "\nVerificando herramientas necesarias..."
    tools=(html2text curl)
    for i in ${tools[@]}; do
        echo -ne "$i\t"
        which $i > /dev/null 2>&1
        if [ $(echo $?) -eq 0 ]; then
            echo " [* Instalado ]"; echo
        else 
            sudo apt-get install $i -y >/dev/null 2>&1; wait  #configuracion para pc
    #		apt install $i -y > /dev/null 2>&1                #configuracion para termux
            sleep 1s
            echo " [* Instalado ]"; sleep 2s
        fi
    done
   echo -e "\n\tListo para su uso\n"
}
	
#main principal

if [ $(which curl) ] && [ $(which html2text) ]; then

    while getopts ":t:h:" opt; do
        case $opt in
            t) traducir=$OPTARG; let contador+=1;;
            h) ayuda;;
        esac
    done

    if [ $contador -eq 0 ]; then
        ayuda
    else
        word_URL=$(curl -s https://www.spanishdict.com/translate/$traducir | html2text | grep -i "add to list" -A 1 | tail -n -1)
#    curl ifconfig.io >/dev/null 2>&1

        if [ $? -eq "0" ]; then
            echo -e "\n\t${cian}\e[3m $traducir ${yellow} <<———>> ${cian}\e[3m \e[1m$word_URL\e[0m\n"
            exit 0
        
        else
            echo -e "\n\t\e[1m No tienes conexion a internet...\e[0m\n"
            exit 1
        fi
    fi

else
	instalar
fi
