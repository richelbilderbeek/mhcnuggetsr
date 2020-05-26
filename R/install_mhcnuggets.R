#' Install the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_on_ci() && !is_mhcnuggets_installed()) {
#'   install_mhcnuggets()
#'   expect_true(is_mhcnuggets_installed())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  if (mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name)) {
    stop("MHCnuggets is already installed")
  }

  # Create the folder if needed, do not warn if it is already present
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)

  # Check if already cloned
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  if (!dir.exists(mhcnuggets_folder)) {
    curwd <- getwd()
    on.exit(setwd(curwd))
    setwd(folder_name)
    system2(
      command = "git",
      args = c(
        "clone",
        paste0(mhcnuggets_url, ".git")
      ),
      stdout = NULL,
      stderr = NULL
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(mhcnuggets_folder))

  if (1 == 2) {
    module <- reticulate::import_from_path(
      module = "mhcnuggets",
      path = mhcnuggets_folder
    )
  }

  if (1 == 2) {
    python <- reticulate:::.globals$py_config$python
    reticulate:::pip_install(python = python, package = "mhcnuggets")
  }
}
