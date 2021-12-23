#!/bin/bash
   
# instala sudo para poder ejecutar 
apt update 
apt-get install sudo
#useradd -G 0 usercortex

# comprueba si existe la carpeta entonces cambia de nombre para archivar 

echo "instalando analyzer"
# sudo apt-get install -y --no-install-recommends python-pip python2.7-dev python3-pip python3-dev ssdeep libfuzzy-dev libfuzzy2 libimage-exiftool-perl libmagic1 build-essential git libssl-dev
#    sudo pip install -U pip setuptools && sudo pip3 install -U pip setuptools  
#cd /opt/

#instala pip y pip 
apt update && apt install -y python3-pip && rm -rf /var/lib/apt/lists/*
pip3 install ldap3 requests

pip install -U pip setuptools && sudo pip3 install -U pip setuptools 

# echo "comprobar ficheros existe"
# filexs=/opt/Cortex-Analyzers
# file=/opt/Cortex-Analyzers/analyzers
# if [ -e $filexs ] 
# then


# elif [ $(ls -A $file) ] 
# then
#     echo "Ya existe el directorio Cortex-Analyzers "   
# else 
#     echo "descargando Cortex-Analyzers"
#     mv /opt/Cortex-Analyzers /opt/Cortex-Analyzers`date +%y%m%d%h%m%s`
#     #descarga los analyzers
#     git clone https://github.com/TheHive-Project/Cortex-Analyzers
# fi

#rm -rfv /opt/Cortex-Analyzers
#mv $PWD/cortex/Cortex-Analyzers $PWD/cortex/Cortex-Analyzers`date +%y%m%d%h%m%s`

#git clone https://github.com/TheHive-Project/Cortex-Analyzers

# Responder y analyzers
# recorre el directorio analyzers descargado y recoore recursivamente el archivo de requerimientos   
for I in $(find Cortex-Analyzers -name 'requirements.txt'); do sudo -H pip install -r $I; done && \
for I in $(find Cortex-Analyzers -name 'requirements.txt'); do sudo -H pip3 install -r $I || true; done


