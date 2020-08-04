#' Determines if the environment is AppVeyor
#' @return TRUE if run on AppVeyor, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_on_appveyor()
#' @export
is_on_appveyor <- function() {
  Sys.getenv("APPVEYOR") != "" # nolint internal function
}

#' Determines if the environment is Travis CI
#' @return TRUE if run on Travis CI, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_on_travis()
#' @export
is_on_travis <- function() {
  Sys.getenv("TRAVIS") != "" # nolint internal function
}

#' Determines if the environment is a continuous integration service
#' @return TRUE if run on AppVeyor or Travis CI, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_on_ci()
#' @export
is_on_ci <- function() {
  mhcnuggetsr::is_on_appveyor() || mhcnuggetsr::is_on_travis()
}
