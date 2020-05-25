#' Check if MHCnuggets is installed. Will \link{stop} if not.
#' @export
check_mhcnuggets_installed <- function() {
  reticulate::import("mhcnuggets")
}
