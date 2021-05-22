#' Install pip.
#' @return Nothing
#' @examples
#' \dontrun{
#'   uninstall_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_pip <- function() {
  stop(
    "'mhcnuggetsr::uninstall_pip' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To uninstall pip from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::uninstall_pip() \n"
  )
}
