#' Install the \code{MHCnuggets} \code{Python} package.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_mhcnuggets()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  if (
    mhcnuggetsr::is_mhcnuggets_installed(
      folder_name = folder_name,
      mhcnuggets_url = mhcnuggets_url
    )
  ) {
    stop("MHCnuggets is already installed in folder '", folder_name, "'")
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
      )
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(mhcnuggets_folder))

  # Update pip
  mhcnuggetsr::install_pip()
  testthat::expect_true(mhcnuggetsr::is_pip_installed())
  mhcnuggetsr::upgrade_pip()

  # Update pyasn1
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "--upgrade", "pyasn1", "--quiet"
    )
  )


  # Install setuptools
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "setuptools", "--quiet"
    )
  )

  # Install mhcnuggets
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "mhcnuggets", "--quiet"
    )
  )
}
