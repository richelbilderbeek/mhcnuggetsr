#' Get the MHCnuggets version
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhcnuggets_version <- function() {
  mhcnuggetsr::check_mhcnuggets_installed()

  output <- system2(
    command = "pip",
    args = c("show", "mhcnuggets"),
    stdout = TRUE
  )
  as.character(
    stats::na.omit(
      stringr::str_match(
        string = output,
        pattern = "Version: (.*)"
      )[, 2]
    )
  )
  # Does not work
  #predict <- reticulate::import(module = "mhcnuggets.src.predict")
  #reticulate::py_run_string("import mhcnuggets; print(mhcnuggets.__version__)")

  # Indeed prints it, but cannot capture it
  # reticulate::py_run_string("import pkg_resources; print(pkg_resources.get_distribution('mhcnuggets').version)")
}
