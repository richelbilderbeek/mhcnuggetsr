#' mhcnuggetsr: estimate the topoplogy of membrane proteins
#'
#' Proteins reside in either the cell plasma of in the
#' cell membrane. A membrane protein goes through the
#' membrane at least once. There are multiple ways to span this
#' hydrophobic layer. One common structure is the transmembrane (alpha)
#' helix (TMH). Given the amino acid sequence of a membrane protein, this
#' package predicts which parts of the protein are TMHs
#'
#' @examples
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides_path <- get_example_filename("test_peptides.peps")
#'   mhc_1_haplotype <- "HLA-A02:01"
#'
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = mhc_1_haplotype
#'   )
#'
#'   predict_ic50_from_file(
#'     peptides_path = peptides_path,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name mhcnuggetsr
NULL
