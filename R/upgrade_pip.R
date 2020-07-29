#' Uograde pip.
#' @return Nothing
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
