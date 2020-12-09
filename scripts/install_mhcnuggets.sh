#!/bin/bash
#
# Installs MHCnuggets using the R code in the 'mhcnuggetsr' package
#
# Because the R code in the package uses 'mhcnuggetsr::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_mhcnuggets.sh
#
#
cat R/*.R > tempscript.R
echo "install_mhcnuggets()" >> tempscript.R
sed -i'.orginal' "s/mhcnuggetsr:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
