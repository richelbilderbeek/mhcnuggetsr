#' Install the \code{MHCnuggets} \code{Python} package.
#' @note Use triple-l, due to bug upstream,
#' bug report at \url{https://github.com/r-lib/roxygen2/issues/1101}
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' library(testthat)
#'
#' if (is_on_ci() && !is_mhcnuggets_installed()) {
#'   # Use triple-l, due to bug upstream,
#'   # bug report at https://github.com/r-lib/roxygen2/issues/1101
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

  # Update pip
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "--upgrade", "pip"
    ),
    stdout = NULL
  )

  # Update pyasn1
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "--upgrade", "pyasn1"
    ),
    stdout = NULL
  )


  # Install setuptools
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "setuptools"
    ),
    stdout = NULL
  )

  # Install MHCnugget
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", file.path(mhcnuggets_folder)
    ),
    stdout = NULL
  )
}
