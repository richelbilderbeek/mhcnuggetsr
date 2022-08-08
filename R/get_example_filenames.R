#' Get the full path to all MHCnuggets example files
#' @inheritParams default_params_doc
#' @return a character vector with all MHCnuggets example files
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_example_filenames()
#' }
#' @seealso use \link{get_example_filename} to get the full
#'   path to a MHCnuggets example file
#' @author Richèl J.C. Bilderbeek
#' @export
get_example_filenames <- function(
    mhcnuggetsr_folder = get_default_mhcnuggetsr_folder(),
    ormr_folder_name = get_default_orm_folder_name()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    ormr_folder_name = ormr_folder_name
  )
  mhcnuggets_folder <- file.path(
    mhcnuggetsr_folder,
    basename(get_mhcnuggets_url())
  )
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  mhcnuggets_examples_folder <- file.path(
    mhcnuggets_folder, "mhcnuggets", "mhcnuggets", "data"
  )
  testthat::expect_true(dir.exists(mhcnuggets_examples_folder))
  all_files <- list.files(
    mhcnuggets_examples_folder,
    full.names = TRUE,
    recursive = TRUE,
  )
  all_files[basename(all_files) != "__init__.py"]
}
