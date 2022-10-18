#' Uninstall the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @param folder_name deprecated name for 'mhcnuggetsr_folder'
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function(
  folder_name = "deprecated",
  mhcnuggets_url = "deprecated"
) {
  stop(
    "'mhcnuggetsr::uninstall_mhcnuggets' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To uninstall MHCnuggets from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::uninstall_mhcnuggets() \n"
  )
}
