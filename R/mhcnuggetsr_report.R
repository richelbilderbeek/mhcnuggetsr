#' Create a \link{mhcnuggetsr} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' \dontrun{
#'   mhcnuggetsr_report()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
mhcnuggetsr_report <- function(
  mhcnuggetsr_folder = get_default_mhcnuggetsr_folder(),
  ormr_folder_name = get_default_orm_folder_name()
) {
  kat <- function(x) cat(x, sep = "\n")
  kat("***************")
  kat("* mhcnuggetsr *")
  kat("***************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  kat("**************")
  kat("* MHCnuggets *")
  kat("**************")
  is_installed <- mhcnuggetsr::is_mhcnuggets_installed(
    mhcnuggetsr_folder = mhcnuggetsr_folder
  )
  kat(
    paste0(
      "Is MHCnuggets installed: ",
      is_installed
    )
  )
  if (is_installed) {
    kat(
      paste0(
        "MHCnuggets version: ",
        mhcnuggetsr::get_mhcnuggets_version()
      )
    )
  }
  kat("*************")
  kat("* ormr info *")
  kat("*************")
  ormr::ormr_report(ormr_folder_name = ormr_folder_name)

  kat("****************")
  kat("* session info *")
  kat("****************")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
