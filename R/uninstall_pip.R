#' Install pip.
#' @return Nothing
#' @examples
#' \dontrun{
#'   uninstall_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_pip <- function() {
  system2(
    reticulate::py_config()$python,
    args = c(
      "-m", "pip", "uninstall", "pip", "--quiet", "--yes"
    )
  )
}
