#' Uninstall the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
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
