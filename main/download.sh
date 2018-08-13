#!/bin/bash

wget  -r --no-parent -l1 https://27crags.com/crags/$1/topos/
wget  -r --no-parent -l1 https://27crags.com/crags/$1/routelist/

find  ./27crags.com/crags/$1/topos/* -exec ./CreateOneTopos.sh {} \;
find  ./27crags.com/crags/$1/topos/* -exec ./tex.sh {} \;
