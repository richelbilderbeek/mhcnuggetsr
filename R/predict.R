#' Predict
#' @inheritParams default_params_doc
#' @export
predict <- function(
  class,
  peptides_path,
  mhc,
  ba_models = FALSE
) {
  mhcnuggetsr::check_mhcnuggets_installed()
  mhcnuggets <- reticulate::import("mhcnuggets")
  mhcnuggets$predict(
    class_ = class,
    peptides_path = peptides_path,
    mhc = mhc,
    ba_models = ba_models
  )
}
