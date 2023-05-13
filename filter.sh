#!/bin/bash

sed -e "s%\$GLASSFISH_HOME%$GLASSFISH_HOME%; s%\$DOMAINDIR%$DOMAINDIR%" \
    < $1 > $2
