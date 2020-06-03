#' Self-test the package
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'
#'   expect_silent(mhcnuggetsr_self_test())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
mhcnuggetsr_self_test <- function(
  mhcnuggets_options = create_test_mhcnuggets_options()
) {
  df <- mhcnuggetsr::predict_ic50(
    peptides = "AIAACAMLLV",
    mhcnuggets_options = mhcnuggets_options
  )
  testthat::expect_equal(df$ic50, 5578.77)
}
