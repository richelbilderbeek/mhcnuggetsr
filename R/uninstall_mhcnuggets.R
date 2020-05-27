#' Uninstall the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )

  # Uninstall the pip package
  system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "uninstall", "mhcnuggets", "--yes"),
    stdout = TRUE
  )

  # Delete folder
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  unlink(mhcnuggets_folder, recursive = TRUE, force = TRUE)
  testthat::expect_true(!dir.exists(mhcnuggets_folder))
}
