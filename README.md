
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

R package to work with `MHCnuggets`.

The goal of mhcnuggetsr is to …

## Installation

You can install the released version of mhcnuggetsr from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("richelbilderbeek/mhcnuggetsr")
#> Skipping install of 'mhcnuggetsr' from a github remote, the SHA1 (189c59f4) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

Install MHCnuggets:

``` r
if (!mhcnuggetsr::is_mhcnuggets_installed()) {
 mhcnuggetsr::install_mhcnuggets()
}
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mhcnuggetsr)
## basic example code
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
