#' Set the MHCnuggets installation state to the desired one
#' @param is_installed the desired installation state. Must
#'   be \link{TRUE} or \link{FALSE}
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
set_is_mhcnuggets_installed <- function(
  is_installed,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  is_cur_installed <- mhcnuggetsr::is_mhcnuggets_installed(
    folder_name = folder_name, mhcnuggets_url = mhcnuggets_url
  )
  if (is_installed == is_cur_installed) return()
  if (is_installed) {
    install_mhcnuggets() # nolint unknown why this function is not exported, see https://github.com/richelbilderbeek/mhcnuggetsr/issues/2
  } else {
    uninstall_mhcnuggets() # nolint unknown why this function is not exported, see https://github.com/richelbilderbeek/mhcnuggetsr/issues/2
  }
}
