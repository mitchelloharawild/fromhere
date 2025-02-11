
<!-- README.md is generated from README.Rmd. Please edit that file -->

# From where? fromhere!

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/fromhere)](https://CRAN.R-project.org/package=fromhere)
[![R-CMD-check](https://github.com/mitchelloharawild/fromhere/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitchelloharawild/fromhere/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `fromhere` R package helps you create file paths relative to various
project roots. It is inspired by the popular
[`{here}`](https://here.r-lib.org/) package, but is more explicit about
where exactly `here()` is.

The package supports many commonly used project types, allowing you to
specify paths relative to various parts of your project. All path
helpers prefixed with `from_rproj()`, allowing you to tab-complete the
desired project root from one of these supported project roots:

- `from_wd()`: For paths relative to the working directory.
- `from_here()`: For paths relative to the
  [`{here}`](https://here.r-lib.org/) package’s automatic project root.
- `from_rproj()`: For R project directories.
- `from_r_package()`: For R package directories.
- `from_remake()`: For remake project directories.
- `from_drake()`: For drake project directories.
- `from_targets()`: For targets project directories.
- `from_pkgdown()`: For pkgdown project directories.
- `from_renv()`: For renv project directories.
- `from_projectile()`: For Projectile project directories.
- `from_quarto()`: For Quarto project directories.
- `from_git()`: For Git repository root directories.
- `from_svn()`: For SVN repository root directories.
- `from_vcs()`: For generic version control root directories (Git or
  SVN).
- `from_testthat()`: For testthat directories.

## Installation

To install the `fromhere` package from GitHub, use the `remotes`
package:

``` r
# Install remotes if you don't have it yet
install.packages("remotes")

# Install fromhere from GitHub
remotes::install_github("mitchelloharawild/fromhere")
```

## Usage

``` r
library(fromhere)
```

`fromhere` provides two main methods for generating file paths relative
to the root of various project types:

1.  **Using functions:** `from_rproj("path/to/file")`

    Using strings to specify file paths, allowing a more programmatic
    approach to building paths.

2.  **Using `$` for autocompletion:** `from_rproj$path$to$file`

    This method allows for a more interactive approach to specifying
    file paths, where the autocompletion is relative to the `from_*`
    folder.

Both methods produce the same result, and you should choose the method
that best fits your needs.

### File paths with functions

File paths can be specified using `"strings"` within the helper
functions (much like `here::here()` and `file.path()`). You can use
`from_rproj("path/to/file")` or pass multiple path components using
`from_rproj("path", "to", "file")`. is more programmatic and provides
flexibility for generating file paths.

The function will automatically generate the appropriate file path
relative to the project root.

**Examples:**

- From an R package:

  ``` r
  from_r_package("R", "from.R")
  #> [1] "/home/github/mitchelloharawild/fromhere/R/from.R"
  ```

  This generates the path to `my_file.R` in the `R` directory, relative
  to the root of the R package.

- From a Git repository:

  ``` r
  from_git("vignettes/portable-paths.Rmd")
  #> [1] "/home/github/mitchelloharawild/fromhere/vignettes/portable-paths.Rmd"
  ```

  This generates the path to the `portable-paths.Rmd` vignette in the
  `vignettes` directory, relative to the root of the Git repository.

### File paths with \$

This method is ideal for interactive usage and provides autocompletion
support for easier navigation. Once you call the `from_rproj` function,
you can use the `$` operator to navigate deeper into the directory
structure, which is particularly useful when working interactively in
RStudio or other IDEs.

**Examples:**

- From an R package:

  ``` r
  from_r_package$R$from.R
  #> [1] "/home/github/mitchelloharawild/fromhere/R/from.R"
  ```

  This generates the path to `my_file.R` in the `R` directory, relative
  to the root of the R package.

- For `testthat` tests:

  ``` r
  from_testthat$tests$testthat.R
  #> [1] "/home/github/mitchelloharawild/fromhere/tests/testthat.R"
  ```

  This generates the path to `testthat.R` in the `tests` directory,
  relative to the root of the `testthat` folder.

File paths created using this package can be further navigated with `$`,
for example:

``` r
rpkg <- from_r_package()
rpkg
#> [1] "/home/github/mitchelloharawild/fromhere"
rpkg$R$from.R
#> [1] "/home/github/mitchelloharawild/fromhere/R/from.R"
```
