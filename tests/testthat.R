library(testthat)
library(mhcnuggetsr)

if (is_on_ci()) install_mhcnuggets()

test_check("mhcnuggetsr")
