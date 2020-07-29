#' Downgrade pip.
#' @param version pip version
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
downgrade_pip <- function(version) {
  testthat::expect_true(is_pip_installed())
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "install", paste0("pip==", version), "--quiet"
    )
  )
}
