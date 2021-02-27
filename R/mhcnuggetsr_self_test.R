#' Self-test the package
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   mhcnuggetsr_self_test()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
mhcnuggetsr_self_test <- function(
  mhcnuggets_options = create_test_mhcnuggets_options(),
  peptides_path = create_temp_peptides_path(),
  mhcnuggets_output_filename = mhcnuggetsr::create_temp_peptides_path(
    fileext = ".csv"
  ),
  verbose = FALSE
) {
  df <- mhcnuggetsr::predict_ic50(
    peptides = "AIAACAMLLV",
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path,
    mhcnuggets_output_filename = mhcnuggets_output_filename,
    verbose = verbose
  )
  testthat::expect_equal(df$ic50, 5578.77)
}
