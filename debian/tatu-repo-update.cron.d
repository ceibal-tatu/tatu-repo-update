# Ejecutar ceibal-update-check cada 10 minutos.
SHELL=/bin/bash

*/10 * * * * root /usr/sbin/ceibal-update-check
