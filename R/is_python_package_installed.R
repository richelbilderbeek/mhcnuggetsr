#' Determine if a Python package is installed
#' @inheritParams default_params_doc
#' @param package_name the Python package's name
#' @return nothing
#' @examples
#' if (beautier::is_on_ci()) {
#'
#'   is_python_package_installed(
#'     ormr_folder_name = "python3",
#'     package_name = "setuptools"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_python_package_installed <- function(
  package_name,
  ormr_folder_name = mhcnuggetsr::get_default_ormr_folder_name(),
  python_version = mhcnuggetsr::get_default_python_version(),
  verbose = FALSE
) {
  stop("DO NOT USE")
  # 'get_installed_python_packages' will check for 'python3'
  package_name %in% mhcnuggetsr::get_installed_python_packages(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )$package
}
