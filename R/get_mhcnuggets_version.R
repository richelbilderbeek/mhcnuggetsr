#' Get the MHCnuggets version
#' @inheritParams default_params_doc
#' @return a string that is a version, for example \code{2.3.2}
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_mhcnuggets_version()
#' }
#' @export
get_mhcnuggets_version <- function(
    mhcnuggetsr_folder = get_default_mhcnuggetsr_folder(),
    ormr_folder_name = get_default_orm_folder_name()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    ormr_folder_name = ormr_folder_name
  )
  output <- system2(
    "python3",
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
