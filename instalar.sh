#!/bin/bash
#
# Instala el repositorio tatu en maquinas basadasn en CM-Ubuntu 
# y ejecuta por primera vez ceibal-update para instalar los 
# parches existentes.
#

unset CDPATH

if [[ $UID -ne 0 ]]; then 
    echo "El script debe ser ejecutado como root." >&2
    exit 1;
fi

PACKAGE=tatu-repo-update.deb

SOURCE_DIR=$(mktemp --tmpdir -d "tatu-update-XXXXXX")
cd "${SOURCE_DIR}"

/usr/bin/wget "http://taturepo1.ddns.net/${PACKAGE}"
if [[ "$?" -ne 0 -o ! -f ${PACKAGE} ]]; then
    echo "Error al bajar ${PACKAGE}." >&2
    exit 1
fi

/usr/bin/dpkg -i "${PACKAGE}"
if [[ "$?" -ne 0 ]]; then
    echo "Error al instalar ${PACKAGE}." >&2
    exit 1
fi

/bin/rm "${PACKAGE}"

# Ejecutar ceibal-update por primera vez.
/usr/sbin/ceibal-update
