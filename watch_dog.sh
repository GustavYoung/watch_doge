#!/bin/bash

# Establece el directorio a monitorearse.
DIR="/home/uxm3/users/"

# Establece la direccion de correo a donde se enviaran los correos de notificación.
EMAIL="anuncios@uxmalstream.mx"

# Esta es la funcion principal del monitor de archivos y luego el trigger de los correos.
inotifywait -r -m -e modify,create,delete $DIR | while read path action file; do
    echo "El archivo '$file' en el directorio '$path' ha sido $action" | mail -s "Cambios detectados en $DIR" $EMAIL
done
