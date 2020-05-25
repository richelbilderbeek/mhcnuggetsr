#' Install the MHCnuggets Python package.
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function() {
  python <- reticulate:::.globals$py_config$python
  reticulate:::pip_install(python = python, package = "mhcnuggets")

  # Works cleanly, fails uninstall
  # reticulate::py_install("mhcnuggets", pip = TRUE)

  # envname <- "r-mhcnuggets"
  # reticulate::conda_create(envname = envname)
  # reticulate::conda_install(envname = envname, "MHCnuggets", pip = TRUE)
#
#   reticulate::conda_create(conda = "bioconda")
#   reticulate::py_install(
#     "mhcnuggets",
#     conda = "r-miniconda"
#     #conda = "https://repo.anaconda.com/pkgs/main/linux-64"
#     #conda = "https://bioconda.anaconda.org/bioconda-forge/linux-64"
#   )
}
