#' Check if MHCnuggets is installed
is_mhcnuggets_installed <- function() {
  is_installed <- FALSE
  tryCatch(
    {
      mhcnuggetsr::check_mhcnuggets_installed()
      is_installed <- TRUE
    },
    error = function(e) {} # nolint no need to inspect e

  )
  is_installed
}
