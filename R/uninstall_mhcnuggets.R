#' Uninstall the MHCnuggets Python package.
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function() {
  python <- reticulate:::.globals$py_config$python
  reticulate:::pip_uninstall(python = python, package = "mhcnuggets")

  if (mhcnuggetsr::is_mhcnuggets_installed()) {
    warning("The Python module 'mhcnuggets' is not uninstalled")
  }
}
