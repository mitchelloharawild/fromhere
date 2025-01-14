#' Create a File Path Relative to a Project Root
#'
#' These functions generate file paths relative to the root of a specific type of project.
#' They use criteria from [rprojroot] to locate the root directory and construct paths
#' using [file.path()].
#'
#' Functions support two ways to specify paths: as function arguments
#' (e.g., `from_r_package("path/to/file")`) or using the `$` operator
#' (e.g., `from_r_package$path$to$file`), which supports autocompletion.
#'
#' The following `from_*` functions are available:
#' - `from_here`: For paths relative to the `{here}` package's automatic project root.
#' - `from_rproj`: For R project directories.
#' - `from_r_package`: For R package directories.
#' - `from_remake`: For remake project directories.
#' - `from_drake`: For drake project directories.
#' - `from_targets`: For targets project directories.
#' - `from_pkgdown`: For pkgdown project directories.
#' - `from_renv`: For renv project directories.
#' - `from_projectile`: For Projectile project directories.
#' - `from_quarto`: For Quarto project directories.
#' - `from_git`: For Git repository root directories.
#' - `from_svn`: For SVN repository root directories.
#' - `from_vcs`: For generic version control root directories (Git or SVN).
#' - `from_testthat`: For testthat directories.
#'
#' @param ... Character components of the relative file path.
#' @return A file path which allows further traversal with `$` autocompletion.
#'
#' @examples
#' # Construct a path from the current working directory
#' from_wd()
#'
#' \dontrun{
#' # Construct a path to a file in an R package
#' from_r_package("R", "my_file.R")
#'
#' # Construct a path in a pkgdown project
#' from_pkgdown$docs$index.html
#'
#' # Construct a path in a Git repository
#' from_git("src", "main.c")
#' }
#'
#' @seealso [rprojroot::find_root()]
#' @rdname from_here
#' @export
from_here <- structure(function(...) {
  require_package("here")

  new_from_path(here::here(...))
}, class = "from_fn")

#' @rdname from_here
#' @export
from_wd <- structure(function(...) {
  new_from_path(normalizePath(file.path(...)))
}, class = "from_fn")

from_rprojroot_criteria <- function(criteria) {
  structure(function(...) {
    root <- rprojroot::find_root(criteria)
    new_from_path(
      file.path(root, ...)
    )
  }, class = "from_fn")
}

#' @rdname from_here
#' @export
from_rproj <- from_rprojroot_criteria(rprojroot::is_rstudio_project)

#' @rdname from_here
#' @export
from_r_package <- from_rprojroot_criteria(rprojroot::is_r_package)

#' @rdname from_here
#' @export
from_remake <- from_rprojroot_criteria(rprojroot::is_remake_project)

#' @rdname from_here
#' @export
from_drake <- from_rprojroot_criteria(rprojroot::is_drake_project)

#' @rdname from_here
#' @export
from_targets <- from_rprojroot_criteria(rprojroot::has_file("_targets.R", contents = "library(targets)", fixed = TRUE))

#' @rdname from_here
#' @export
from_pkgdown <- from_rprojroot_criteria(rprojroot::is_pkgdown_project)

#' @rdname from_here
#' @export
from_renv <- from_rprojroot_criteria(rprojroot::is_renv_project)

#' @rdname from_here
#' @export
from_projectile <- from_rprojroot_criteria(rprojroot::is_projectile_project)

#' @rdname from_here
#' @export
from_quarto <- from_rprojroot_criteria(rprojroot::is_quarto_project)

#' @rdname from_here
#' @export
from_git <- from_rprojroot_criteria(rprojroot::is_git_root)

#' @rdname from_here
#' @export
from_svn <- from_rprojroot_criteria(rprojroot::is_svn_root)

#' @rdname from_here
#' @export
from_vcs <- from_rprojroot_criteria(rprojroot::is_vcs_root)

#' @rdname from_here
#' @export
from_testthat <- from_rprojroot_criteria(rprojroot::is_testthat)
