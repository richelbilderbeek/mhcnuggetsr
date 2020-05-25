#' Check if MHCnuggets is installed. Will \link{stop} if not.
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhcnuggets_installed <- function() {
  if (!reticulate::py_module_available("mhcnuggets")) {
    stop("The Python module 'mhcnuggets' is absent")
  }
}
