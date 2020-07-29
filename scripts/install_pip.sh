#!/bin/bash
#
# Installs pip using the R code in the 'mhcnuggetsr' package
#
# Usage:
#
#  ./scripts/install_pip.sh
#
#
cat R/install_pip.R >> tempscript.R
echo "install_pip()" >> tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R

