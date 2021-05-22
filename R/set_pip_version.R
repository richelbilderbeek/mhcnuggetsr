#' Set the version of pip.
#'
#' Set the version of pip to a specific version,
#' by installing that version.
#' @param version pip version
#' @return Nothing
#' @seealso use \link{upgrade_pip} to set pip to the latest version.
#' Use \link{downgrade_pip} to set pip to a specific earlier version.
#' @author Richèl J.C. Bilderbeek
#' @export
set_pip_version <- function(version) {
  stop(
    "'mhcnuggetsr::set_pip_version' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To set a pip version from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::set_pip_version([your version]) \n"
  )
}
