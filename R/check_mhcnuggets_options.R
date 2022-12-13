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
  mhcnuggetsr::check_ba_models(mhcnuggets_options$ba_models)
  mhcnuggetsr::check_verbose(mhcnuggets_options$verbose)
  mhcnuggetsr::check_mhcnuggetsr_folder(mhcnuggets_options$mhcnuggetsr_folder)
  mhcnuggetsr::check_mhcnuggets_url(mhcnuggets_options$mhcnuggets_url)
  mhcnuggetsr::check_mhc(mhcnuggets_options$mhc)

  mhcnuggetsr::check_mhcnuggets_installation(
    mhcnuggetsr_folder = mhcnuggets_options$mhcnuggetsr_folder,
    ormr_folder_name = get_default_orm_folder_name()
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
  invisible(mhcnuggets_options)
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
    "mhcnuggetsr_folder",
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
