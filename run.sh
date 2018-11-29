#!/bin/bash
#echo ynny | /usr/bin/phoronix-test-suite batch-setup
#/usr/bin/phoronix-test-suite phoromatic.connect $URL:80/$CODE
#/usr/bin/phoronix-test-suite $COMMAND

echo -e "y\nn" | /usr/bin/phoronix-test-suite user-config-set ColoredConsole=TRUE | grep -v "Operation not permitted"
/usr/bin/phoronix-test-suite diagnostics | grep -v "Operation not permitted"
/usr/bin/phoronix-test-suite system-info | grep -v "Operation not permitted"
/usr/bin/phoronix-test-suite system-sensors | grep -v "Operation not permitted"
#echo "n" | /usr/bin/phoronix-test-suite default-run build-linux-kernel compress-7zip ffmpeg redis sqlite stream | grep -v "Operation not permitted"