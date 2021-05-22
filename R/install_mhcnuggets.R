#' Install the \code{MHCnuggets} \code{Python} package.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_mhcnuggets()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
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
