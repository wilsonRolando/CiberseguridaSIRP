#!/bin/bash
#copia el archivo AnalyzerCortexCopy.sh desde el repositorio del pc principal hacia el contenedor
docker  cp AnalyzerCortexCopy.sh cortex:/opt

# file=$PWD/cortex/Cortex-Analyzers
# if [ -e $file ] 
# then
#     echo "El directorio /opt/Cortex-Analyzers  ya existe, se renombra para conservar los datos históricos "
#     #sudo rm -rfv $PWD/cortex/Cortex-Analyzers 
#     #mv $PWD/cortex/Cortex-Analyzers $PWD/cortex/Cortex-Analyzers`date +%y%m%d%h%m%s`    
# fi
    
#descarga los analyzers
#cd $PWD/cortex/

#git clone https://github.com/TheHive-Project/Cortex-Analyzers

#sudo chown -R 1000:1000 $PWD/cortex
sudo chmod -R 777 $PWD/cortex

#accede al contenedor al archivo copiado, da permisos de ejecucion y ejecuta
docker exec -ti cortex bash -c "cd /opt ; chmod +x AnalyzerCortexCopy.sh ; ./AnalyzerCortexCopy.sh"



docker restart cortex 
#en el archivo AnalyzerCortexCopy.sh contiene la instalación de los requerimientos de los analyzer 


# ElastAlert
# crear indice
#docker exec -ti -u 0 elastalert bash -c "elastalert-create-index"


