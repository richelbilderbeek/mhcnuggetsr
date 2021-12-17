#' Get the full path to an MHCnuggets example file
#' @param filename name of the example file, without the path
#' @return the full path to an MHCnuggets example file
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_example_filename("test_peptides.peps")
#' }
#' @seealso use \link{get_example_filenames} to get all MHCnuggets
#'   example filenames
#' @author Richèl J.C. Bilderbeek
#' @export
get_example_filename <- function(
  filename = "test_peptides.peps",
  mhcnuggets_folder = get_default_mhcnuggets_folder()
) {
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
  filename <- all_files[basename(all_files) == filename]
  if (length(filename) == 0) {
    stop(
      "'filename' not found.\n",
      "Value of 'filename': ", filename, "\n",
      "Tip: use 'get_example_filenames' to get a list of all possible filenames"
    )
  }
  filename
}
