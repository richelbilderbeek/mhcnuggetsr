#' This function does nothing. It is intended to inherit the documentation
#' of the parameters from.
#' @param ba_models Set to TRUE to use a pure BA model
#' @param mhc the MHC haplotype name
#' @param mhcs the MHC haplotype names
#' @param mhc_class MHC class. Must be \code{I}, \code{II}
#'   or \link{NA}. Use \link{NA} to let the class be deduced automatically
#' @param mhcnuggets_options options to run MHCnuggets with,
#'   as can be created by \link{create_mhcnuggets_options}.
#' @param mhcnuggets_output_filename name of a temporary file where
#'   MHCnuggets writes its output to
#' @param mhcnuggets_url URL to the MHCnuggets GitHub repository
#' @param mhcnuggetsr_folder folder where `mhcnuggetsr` stores its
#' temporary files. Use \link{get_default_mhcnuggetsr_folder}
#' for its default value.
#' @param n_aas number of amino acids
#' @param ormr_folder_name folder used by the `ormr` package
#' to install Python packages to.
#' Use `python3` to install Python packages via `pip`.
#' Default value is `python3`
#' @param peptide_length length of a peptide, in number of amino acids
#' @param peptide one peptide sequence
#' @param peptides one of more peptide sequences
#' @param peptides_path the path to the peptides
#' @param protein_sequence protein sequence, in uppercase,
#'   for example \code{FAMILYVW}
#' @param verbose set to \link{TRUE} for more debug information
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  ba_models,
  mhc, mhcs,
  mhc_class,
  mhcnuggets_options,
  mhcnuggets_output_filename,
  mhcnuggets_url,
  mhcnuggetsr_folder,
  n_aas,
  ormr_folder_name,
  peptide, peptides,
  peptide_length,
  peptides_path,
  protein_sequence,
  verbose
) {
  # Nothing
}
