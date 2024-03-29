#' Set the MHCnuggets installation state to the desired one
#' @param is_installed the desired installation state. Must
#'   be \link{TRUE} or \link{FALSE}
#' @inheritParams default_params_doc
#' @param folder_name deprecated name for 'mhcnuggetsr_folder'
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
set_is_mhcnuggets_installed <- function(
  is_installed,
  verbose = "deprecated",
  folder_name = "deprecated",
  mhcnuggets_url = "deprecated"
) {
  stop(
    "'mhcnuggetsr::set_is_mhcnuggets_installed' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To set if MHCnuggets is installed from R, do: \n",
    " \n",
    "remotes::install_github(",
      "\"richelbilderbeek/set_is_mhcnuggets_installed\") \n",
    "mhcnuggetsrinstall::set_pip_version([your version]) \n"
  )
}
