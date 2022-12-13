#' Convert a `mhcnuggets_options` to text
#'
#' Convert a `mhcnuggets_options` to text
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   mhcnuggets_options_to_text(create_test_mhcnuggets_options())
#' }
#' @export
mhcnuggets_options_to_text <- function(mhcnuggets_options) {
  mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)

  name <- NULL; rm(name) # nolint, fixes warning: no visible binding for global variable
  value <- NULL; rm(value) # nolint, fixes warning: no visible binding for global variable

  t <- tibble::tibble(
    name = names(mhcnuggets_options),
    value = paste0(mhcnuggets_options)
  )
  paste0(
    as.character(dplyr::transmute(t, text = paste0(name, ": ", value))$text),
    collapse = ", "
  )
}
