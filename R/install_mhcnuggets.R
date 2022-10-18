#' Install the \code{MHCnuggets} \code{Python} package.
#' @inheritParams default_params_doc
#' @param folder_name deprecated name for 'mhcnuggetsr_folder'
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_mhcnuggets()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function(
  folder_name = "deprecated",
  mhcnuggets_url = "deprecated"
) {
  stop(
    "'mhcnuggetsr::install_mhcnuggets' is deprecated, \n",
    "as it violated CRAN policy. \n",
    " \n",
    "To install MHCnuggets from R, do: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/mhcnuggetsrinstall\") \n",
    "mhcnuggetsrinstall::install_mhcnuggets() \n"
  )
}
