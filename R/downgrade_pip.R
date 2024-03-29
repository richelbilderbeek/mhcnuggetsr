#' Downgrade pip.
#'
#' Set the version of pip to a specific earlier version.
#' @param version pip version
#' @return Nothing
#' @seealso use \link{upgrade_pip} to set pip to the latest version.
#' Use \link{set_pip_version} to install a specific version of pip
#' @examples
#' \dontrun{
#'   if (is_pip_installed()) {
#'     downgrade_pip()
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
downgrade_pip <- function(version = "9.0.0") {
  stop(
    "'mhcnuggetsr::downgrade_pip' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To downgrade pip from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::downgrade_pip() \n"
  )
}
