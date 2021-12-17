#' Get the path to the folder where this package installs
#' `MHCnuggets` by default
#' @return the path to the folder where this package installs
#'   `MHCnuggets`` by default
#' @examples
#' get_default_mhcnuggets_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_mhcnuggets_folder <- function(
  mhcnuggetsr_folder = get_default_mhcnuggetsr_folder()
) {
  file.path(mhcnuggetsr_folder, "mhcnuggets")
}
