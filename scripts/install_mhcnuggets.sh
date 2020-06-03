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
cat R/install_mhcnuggets.R > tempscript.R
cat R/get_default_mhcnuggets_folder.R >> tempscript.R
cat R/get_mhcnuggets_url.R >> tempscript.R
cat R/is_mhcnuggets_installed.R >> tempscript.R

echo "install_mhcnuggets()" >> tempscript.R
sed -i'.orginal' "s/mhcnuggetsr:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
