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
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  mhcnuggets_examples_folder <- file.path(
    mhcnuggets_folder, "mhcnuggets", "data"
  )
  testthat::expect_true(dir.exists(mhcnuggets_examples_folder))
  all_files <- list.files(
    mhcnuggets_examples_folder,
    full.names = TRUE,
    recursive = TRUE,
  )
  all_files[basename(all_files) != "__init__.py"]
}
