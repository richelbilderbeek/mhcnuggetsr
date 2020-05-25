#' Create a \link{mhcnuggetsr} report, to be used when reporting bugs
#' @examples
#' library(testthat)
#'
#' expect_output(mhcnuggetsr_report())
#' @author Richèl J.C. Bilderbeek
#' @export
mhcnuggetsr_report <- function() {
  kat <- function(x) cat(x, sep = "\n")
  kat("***************")
  kat("* mhcnuggetsr *")
  kat("***************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  kat(paste0("Python available: ", reticulate::py_available()))
  kat("**************")
  kat("* MHCnuggets *")
  kat("**************")
  kat(
    paste0(
      "Is MHCnuggets installed: ",
      mhcnuggetsr::is_mhcnuggets_installed()
    )
  )
  if (mhcnuggetsr::is_mhcnuggets_installed()) {
    kat(
      paste0(
        "MHCnuggets version: ",
        mhcnuggetsr::get_mhcnuggets_version()
      )
    )
  }
  kat("***************")
  kat("* sessionInfo *")
  kat("***************")
  print(utils::sessionInfo())
}
