#' Create a \link{mhcnuggetsr} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' \dontrun{
#'   mhcnuggetsr_report()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
mhcnuggetsr_report <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  kat <- function(x) cat(x, sep = "\n")
  kat("***************")
  kat("* mhcnuggetsr *")
  kat("***************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  tryCatch({
      kat(paste0("Python location: ", reticulate::py_config()$python))
    }, error = function(e) {
      kat("Python location: none, no Miniconda Python environment yet")
    }
  )
  kat(paste0("Is pip installed: ", mhcnuggetsr::is_pip_installed()))
  if (mhcnuggetsr::is_pip_installed()) {
    kat(paste0("pip version: ", mhcnuggetsr::get_pip_version()))
    knitr::kable(mhcnuggetsr::get_python_package_versions())
    kat(paste0("Python NumPy available: ", reticulate::py_numpy_available()))
    kat(
      paste0(
        "Python mhcnuggets available: ",
        reticulate::py_module_available("mhcnuggets")
      )
    )
  }
  kat("**************")
  kat("* MHCnuggets *")
  kat("**************")
  is_installed <- mhcnuggetsr::is_mhcnuggets_installed(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
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
  } else {
    kat(
      paste0(
        "Tip: when working on the Groninger Peregrine computer cluster, \n",
        "type: \n",
        "\n",
        "~/.local/share/r-miniconda/envs/r-reticulate/bin/python ",
        "-m pip  install mhcnuggets"
      )
    )


  }
  kat("***************")
  kat("* sessionInfo *")
  kat("***************")
  print(utils::sessionInfo())
}
