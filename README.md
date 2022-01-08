## Plataforma de Respuesta a incidencias 

![](https://www.idceconsulting.com/themes/idce/images/logo.png)

### Requerimientos 
- Docker 20.10 +
- Docker-compose 1.29 +
- Ubuntu 20.04
- 16 GB RAM +
- 8 vCPUs +

### Instalación
* Modificar el archivo *.env* , variable de entorno IP_PUBLICA, para desplegar en un entorno local ingresar la ip del host.
* En el directorio *CiberseguridaSIRP/*,  ejecutar:
```bash
docker-compose -f 1.docker-compose.yml up -d
./2.permission-script.sh
./3.AnalyzerResponder-script.sh
./4.kibanaWuazuh-Plugin.sh
```


### Integración 
- En cortex y MISP, generar la api-key de un usuario y remplazar en el campo *key* del archivo *thehive/application.conf*, reiniciar thehive
```yaml
docker restart thehive
```
- En thehive, generar el api-key de un usuario con permisos de crear alertas y remplazar en la regla elastAlert/rule/rule-test.yml

### Test
- Descargar filebeat,  configurar el archivo filebeat.yml, en el directorio test se encuentra una muestra de configuración del archivo filebeat.yml  con un test.log de prueba.
- Ejecutar filebeat, e ingresar registros en el test.log, si todo esta correcto, los registros se observa en kibana, y al ingresar más de dos registros repetidos continuos, se generan alertas en thehive. 
