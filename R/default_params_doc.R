#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param ba_models Set to TRUE to use a pure BA model
#' @param class MHC class. Must be \code{I} or \code{II}
#' @param mhc the MHC haplotype
#' @param peptides_path the path to the peptides
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  ba_models,
  class,
  mhc,
  peptides_path
) {
  # Nothing
}
