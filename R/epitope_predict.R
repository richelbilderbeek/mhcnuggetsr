#' Predict
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
epitope_predict <- function(
  mhc_class,
  peptides_path,
  mhc,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  if (!mhc_class %in% c("I", "II")) {
    stop(
      "'class' must be either 'I' or 'II'. \n",
      "Actual value: ", mhc_class
    )
  }
  if (!file.exists(peptides_path)) {
    stop(
      "Cannot find 'peptides_path'. \n",
      "Actual value: ", peptides_path
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation()
  if (mhc_class == "I" && mhc %in% get_trained_mhc_2_haplotypes()) {
    stop("Must use the same 'mhc_class' as the 'mhc' is from")
  }
  if (mhc_class == "II" && mhc %in% get_trained_mhc_1_haplotypes()) {
    stop("Must use the same 'mhc_class' as the 'mhc' is from")
  }
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  module <- reticulate::import_from_path(
    module = "mhcnuggets.src.predict",
    path = file.path(mhcnuggets_folder, "mhcnuggets")
  )
  module$predict(
    class_ = mhc_class,
    peptides_path = peptides_path,
    mhc = mhc,
    ba_models = ba_models
  )
#
#
#   if (1 == 2) {
#     mhcnuggets <- reticulate::import(module = "mhcnuggets")
#
#     predict <- reticulate::import(module = "mhcnuggets.src.predict")
#     reticulate::py_help(predict)
#      mhcnuggets$predict()
#     reticulate::py_help(mhcnuggets$src$predict)
#     mhcnuggets$src$aa_embeddings()
#     reticulate::py_help(mhcnuggets$src)
#     mhcnuggets$src$find_closest_mhcI()
#     predict(
#       class_ = class,
#       peptides_path = peptides_path,
#       mhc = mhc,
#       ba_models = ba_models
#     )
#   }
}
