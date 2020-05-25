#' Predict
#' @inheritParams default_params_doc
#' @export
predict <- function(
  class,
  peptides_path,
  mhc,
  ba_models = FALSE
) {
  c(class, peptides_path, mhc, ba_models)
}
