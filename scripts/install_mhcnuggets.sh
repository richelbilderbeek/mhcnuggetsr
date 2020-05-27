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
cat R/install_mhcnuggets.R > tmp_install_mhcnuggets.R
cat R/get_default_mhcnuggets_folder.R >> tmp_install_mhcnuggets.R
cat R/get_mhcnuggets_url.R >> tmp_install_mhcnuggets.R
cat R/is_mhcnuggets_installed.R >> tmp_install_mhcnuggets.R

# Use triple-l for now
echo "installl_mhcnuggets()" >> tmp_install_mhcnuggets.R
sed -i'.orginal' "s/mhcnuggetsr:://g" tmp_install_mhcnuggets.R
cat tmp_install_mhcnuggets.R
Rscript tmp_install_mhcnuggets.R
rm tmp_install_mhcnuggets.R
