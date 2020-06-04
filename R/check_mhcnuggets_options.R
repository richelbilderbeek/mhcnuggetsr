#' Check the MHCnuggets options. Will \link{stop} if the options are invalid.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'   expect_silent(check_mhcnuggets_options(create_test_mhcnuggets_options()))
#'   expect_error(check_mhcnuggets_options("nonsense"))
#' } else {
#'   expect_error(check_mhcnuggets_options(create_test_mhcnuggets_options()))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhcnuggets_options <- function(
  mhcnuggets_options
) {
  if (!is.list(mhcnuggets_options)) {
    stop(
      "'mhcnuggets_options' must be a list. \n",
      "Actual class: ", class(mhcnuggets_options), " \n",
      "Actual value: ", mhcnuggets_options
    )
  }
  expected_names <- names(mhcnuggetsr::create_test_mhcnuggets_options())
  for (name in expected_names) {
    if (!name %in% names(mhcnuggets_options)) {
      stop(
        "'mhcnuggets_options' must have an element named '", name, "'"
      )
    }
  }

  if (!mhcnuggets_options$mhc_class %in% c("I", "II")) {
    stop(
      "'mhc_class' must be either 'I' or 'II'. \n",
      "Actual value: ", mhcnuggets_options$mhc_class
    )
  }
  if (!is_mhcnuggets_name(mhcnuggets_options$mhc)) {
    stop(
      "'mhc' must be a valid MHC haplotype name", "\n",
      "Actual value: ", mhcnuggets_options$mhc, "\n",
      "Tip: see 'get_mhc_1_haplotypes' or 'get_mhc_2_haplotypes'"
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = mhcnuggets_options$folder_name,
    mhcnuggets_url = mhcnuggets_options$mhcnuggets_url
  )
  if (mhcnuggets_options$mhc_class == "I" &&
      mhcnuggets_options$mhc %in% get_trained_mhc_2_haplotypes()
  ) {
    stop(
      "Must use the same 'mhc_class' as the 'mhc' is from. \n",
      "'mhcnuggets_options$mhc_class': ", mhcnuggets_options$mhc_class, " \n",
      "'mhcnuggets_options$mhc': ", mhcnuggets_options$mhc
    )
  }
  if (mhcnuggets_options$mhc_class == "II" &&
      mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes()
  ) {
    stop(
      "Must use the same 'mhc_class' as the 'mhc' is from. \n",
      "'mhcnuggets_options$mhc_class': ", mhcnuggets_options$mhc_class, " \n",
      "'mhcnuggets_options$mhc': ", mhcnuggets_options$mhc
    )
  }
}
