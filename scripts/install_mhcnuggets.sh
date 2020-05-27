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
cat R/install_mhcnuggets.R > install_mhcnuggets.R
cat R/get_default_mhcnuggets_folder.R >> install_mhcnuggets.R
cat R/get_mhcnuggets_url.R >> install_mhcnuggets.R
cat R/is_mhcnuggets_installed.R >> install_mhcnuggets.R
echo "install_mhcnuggets()" >> install_mhcnuggets.R
sed -i'.orginal' "s/mhcnuggetsr:://g" install_mhcnuggets.R
cat install_mhcnuggets.R
Rscript install_mhcnuggets.R
