#' Check if MHCnuggets is installed
#' @inheritParams default_params_doc
#' @return TRUE if MHCnuggets is installed
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_mhcnuggets_installed()
#' @export
is_mhcnuggets_installed <- function(
  mhcnuggetsr_folder = get_default_mhcnuggetsr_folder()
) {
  is_installed <- FALSE
  tryCatch({
      mhcnuggetsr::check_mhcnuggets_installation(
        mhcnuggetsr_folder = mhcnuggetsr_folder
      )
      is_installed <- TRUE
    },
    error = function(e) {} # nolint no need to inspect e

  )
  is_installed
}
