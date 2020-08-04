#' Uograde pip.
#' @return Nothing
#' @seealso use \link{downgrade_pip} to set pip to an earlier version.
#' Use \link{set_pip_version} to install a specific version of pip
#' @examples
#' \dontrun{
#'   install_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
upgrade_pip <- function() {
  testthat::expect_true(mhcnuggetsr::is_pip_installed())
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", "--upgrade", "pip", "--quiet"
    )
  )
}
