#' Install pip.
#' @param python_script_filename name of a temporary Python
#' script file. Will be deleted at the end of the function
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_pip <- function(
  python_script_filename = file.path(
    tmpdir = rappdirs::user_cache_dir(),
    "temp_install_pip.py"
  )
) {
  stop(
    "'mhcnuggetsr::install_pip' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To install pip from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::install_pip() \n"
  )
}
