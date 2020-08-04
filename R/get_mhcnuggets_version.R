#' Get the MHCnuggets version
#' @inheritParams default_params_doc
#' @return a string that is a version, for example \code{2.3.2}
#' @author Richèl J.C. Bilderbeek
#' @examples
#' get_mhcnuggets_version()
#' @export
get_mhcnuggets_version <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
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
