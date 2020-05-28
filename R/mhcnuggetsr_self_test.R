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
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  df <- mhcnuggetsr::predict_ic50(
    mhc_class = "I",
    peptides = "AIAACAMLLV",
    mhc = "HLA-A02:01",
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
  testthat::expect_equal(df$ic50, 5578.77)
}
