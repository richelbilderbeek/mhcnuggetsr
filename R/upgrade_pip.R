#' Uograde pip.
#' @return Nothing
#' @seealso use \link{downgrade_pip} to set pip to an earlier version.
#' Use \link{set_pip_version} to install a specific version of pip
#' @author Richèl J.C. Bilderbeek
#' @export
upgrade_pip <- function() {
  stop(
    "'mhcnuggetsr::upgrade_pip' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To upgrade pip from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::upgrade_pip() \n"
  )
}
