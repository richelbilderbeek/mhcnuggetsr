
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mhcnuggetsr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/mhcnuggetsr)](https://CRAN.R-project.org/package=mhcnuggetsr)

| Branch    | [![Travis CI logo](man/figures/TravisCI.png)](https://travis-ci.org)                                                                         | [![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)                                                                                                         |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `master`  | [![Build Status](https://travis-ci.org/richelbilderbeek/mhcnuggetsr.svg?branch=master)](https://travis-ci.org/richelbilderbeek/mhcnuggetsr)  | [![codecov.io](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/branch/master)   |
| `develop` | [![Build Status](https://travis-ci.org/richelbilderbeek/mhcnuggetsr.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/mhcnuggetsr) | [![codecov.io](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/branch/develop) |

<!-- badges: end -->

R package to work with
[MHCnuggets](https://github.com/KarchinLab/mhcnuggets).

The goal of `mhcnuggetsr` is to …

## Installation

You can install the released version of mhcnuggetsr from
[GitHub](https://github.com/) with:

    devtools::install_github("richelbilderbeek/mhcnuggetsr")

Install MHCnuggets:

``` r
library(mhcnuggetsr)

if (!is_mhcnuggets_installed()) {
  install_mhcnuggets()
  mhcnuggetsr_self_test()
}
```

## Example

Here is how to get the IC50 values (in nM) for the peptides in an
example file:

``` r
library(knitr)
library(mhcnuggetsr)

if (is_mhcnuggets_installed()) {
  df <- predict_ic50(
    mhc_class = "I",
    peptides = "AIAACAMLLV",
    mhc = "HLA-A02:01"
  )
  testthat::expect_equal(df$ic50, 5578.77)
}
```

## There is a feature I miss

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting use cases`

## I want to collaborate

See [CONTRIBUTING](CONTRIBUTING.md), at ‘Submitting code’

## I think I have found a bug

See [CONTRIBUTING](CONTRIBUTING.md), at ‘Submitting bugs’

## There’s something else I want to say

Sure, just add an Issue. Or send an email.

## External links

  - [MHCnuggets GitHub repo](https://github.com/KarchinLab/mhcnuggets)

## References

Article about MHCnuggets:

  - Shao, Xiaoshan M., et al. “High-throughput prediction of MHC class I
    and II neoantigens with MHCnuggets.” Cancer Immunology Research 8.3
    (2020): 396-408.
