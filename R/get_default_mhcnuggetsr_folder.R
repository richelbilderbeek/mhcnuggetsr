#' Get the path to the folder where this package installs
#' the required Python packages by default
#' @return the path to the folder where this package installs
#' the required Python packages by default
#' @examples
#' get_default_mhcnuggetsr_folder()
#' @seealso there are two default folders:
#'  * the default `mhcnuggetsr` folder, as can be obtained
#'    with \link{get_default_mhcnuggetsr_folder}.
#'    This is where the Python packages needed are installed,
#'    using the `ormr` package: the `ormr_folder_name`
#'    equals the `mhcnuggetsr_folder`
#'  * the default `MHCnuggets` folder, as can be obtained
#'    with \link{get_default_mhcnuggets_folder}.
#'    This is where the `MHCnuggets` source code is cloned to.
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_mhcnuggetsr_folder <- function() {
  rappdirs::user_data_dir(appname = "mhcnuggetsr")
}
