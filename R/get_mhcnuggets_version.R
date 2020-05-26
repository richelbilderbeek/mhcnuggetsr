#' Get the MHCnuggets version
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhcnuggets_version <- function() {
  mhcnuggetsr::check_mhcnuggets_installation()

  output <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "show", "mhcnuggets"),
    stdout = TRUE
  )

  as.character(
    stats::na.omit(
      stringr::str_match(
        string = output,
        pattern = "Version: (.*)"
      )[, 2]
    )
  )
}
