#' Determine if the MHCnuggets options is valid
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   is_mhcnuggets_options(create_test_mhcnuggets_options())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_mhcnuggets_options <- function(
  mhcnuggets_options
) {
  is <- FALSE
  tryCatch({
      mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
      is <- TRUE
    },
    error = function(e) {} # nolint indeed ignore
  )
  is
}
