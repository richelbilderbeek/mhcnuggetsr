#' Install pip.
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_pip <- function() {
  script_filename <- tempfile()

  utils::download.file(
    url = "https://bootstrap.pypa.io/get-pip.py",
    destfile = script_filename,
    quiet = TRUE
  )
  system2(
    reticulate::py_config()$python,
    args = c(script_filename, "--user"),
    stdout = FALSE
  )
}
