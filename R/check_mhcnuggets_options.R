#' Check the MHCnuggets options.
#'
#' Check the MHCnuggets options.
#' Will \link{stop} if the options are invalid.
#'
#' @note an \code{mhcnuggets_options} created
#' by \link{create_mhcnuggets_options} is always
#' checked by \link{check_mhcnuggets_options}
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   check_mhcnuggets_options(create_test_mhcnuggets_options())
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
  mhcnuggetsr::check_mhcnuggets_options_names(mhcnuggets_options)
  mhcnuggetsr::check_mhc_class(mhcnuggets_options$mhc_class)
  if (!is_mhcnuggets_name(mhcnuggets_options$mhc)) {
    stop(
      "'mhc' must be a valid MHC haplotype name", "\n",
      "Actual value: ", mhcnuggets_options$mhc, "\n",
      "Tip: use 'to_mhcnuggets_name' to convert to an MHCnuggets name,",
      "or see 'get_mhc_1_haplotypes' or 'get_mhc_2_haplotypes' for examples"
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = mhcnuggets_options$folder_name,
    mhcnuggets_url = mhcnuggets_options$mhcnuggets_url
  )
  if (!is.na(mhcnuggets_options$mhc_class) &&
      mhcnuggets_options$mhc_class == "I" &&
      mhcnuggets_options$mhc %in% get_trained_mhc_2_haplotypes()
  ) {
    stop(
      "Must use the same 'mhc_class' as the 'mhc' is from. \n",
      "'mhcnuggets_options$mhc_class': ", mhcnuggets_options$mhc_class, " \n",
      "'mhcnuggets_options$mhc': ", mhcnuggets_options$mhc
    )
  }
  if (!is.na(mhcnuggets_options$mhc_class) &&
      mhcnuggets_options$mhc_class == "II" &&
      mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes()
  ) {
    stop(
      "Must use the same 'mhc_class' as the 'mhc' is from. \n",
      "'mhcnuggets_options$mhc_class': ", mhcnuggets_options$mhc_class, " \n",
      "'mhcnuggets_options$mhc': ", mhcnuggets_options$mhc
    )
  }
}

#' Check the names of the elements in an \code{mhcnuggets_options} list.
#'
#' Check the names of the elements in an \code{mhcnuggets_options} list.
#' Will \link{stop} if an element is missing.
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   check_mhcnuggets_options_names(
#'     create_test_mhcnuggets_options()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhcnuggets_options_names <- function(
  mhcnuggets_options
) {
  testthat::expect_true(is.list(mhcnuggets_options))
  expected_names <- c(
    "mhc_class",
    "mhc",
    "ba_models",
    "verbose",
    "folder_name",
    "mhcnuggets_url"
  )
  for (name in expected_names) {
    if (!name %in% names(mhcnuggets_options)) {
      stop(
        "'mhcnuggets_options' must have an element named '", name, "'"
      )
    }
  }
}
