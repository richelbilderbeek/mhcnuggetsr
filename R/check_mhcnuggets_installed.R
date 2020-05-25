#' Check if MHCnuggets is installed. Will \link{stop} if not.
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhcnuggets_installed <- function() {
  reticulate::import("mhcnuggets")
}
