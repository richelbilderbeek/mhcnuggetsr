#' Check if MHCnuggets is installed
#' @inheritParams default_params_doc
#' @return TRUE if MHCnuggets is installed
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_mhcnuggets_installed()
#' @export
is_mhcnuggets_installed <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  is_installed <- FALSE
  tryCatch({
      mhcnuggetsr::check_mhcnuggets_installation(
        folder_name = folder_name,
        mhcnuggets_url = mhcnuggets_url
      )
      is_installed <- TRUE
    },
    error = function(e) {} # nolint no need to inspect e

  )
  is_installed
}
