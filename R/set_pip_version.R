#' Set the version of pip.
#'
#' Set the version of pip to a specific version,
#' by installing that version.
#' @param version pip version
#' @return Nothing
#' @seealso use \link{upgrade_pip} to set pip to the latest version.
#' Use \link{downgrade_pip} to set pip to a specific earlier version.
#' @examples
#' \dontrun{
#'   if (is_pip_installed()) {
#'     set_pip_version("19.0")
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
set_pip_version <- function(version) {
  testthat::expect_true(mhcnuggetsr::is_pip_installed())
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", paste0("pip==", version), "--quiet"
    )
  )
}
