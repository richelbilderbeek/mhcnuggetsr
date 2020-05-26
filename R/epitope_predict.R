#' Predict
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
epitope_predict <- function(
  class,
  peptides_path,
  mhc,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::check_mhcnuggets_installation()
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  module <- reticulate::import_from_path(
    module = "mhcnuggets.src.predict",
    path = file.path(mhcnuggets_folder, "mhcnuggets")
  )
  module$src


  if (1 == 2) {
    mhcnuggets <- reticulate::import(module = "mhcnuggets")

    predict <- reticulate::import(module = "mhcnuggets.src.predict")
    reticulate::py_help(predict)
     mhcnuggets$predict()
    reticulate::py_help(mhcnuggets$src$predict)
    mhcnuggets$src$aa_embeddings()
    reticulate::py_help(mhcnuggets$src)
    mhcnuggets$src$find_closest_mhcI()
    predict(
      class_ = class,
      peptides_path = peptides_path,
      mhc = mhc,
      ba_models = ba_models
    )
  }
}
