#' @export
new_from_path <- function(path) {
  structure(path, class = "from_path")
}

#' @export
`$.from_path` <- function(x, name) {
  new_from_path(file.path(x, name))
}

#' @export
`$.from_fn` <- function(x, name) {
  x(name)
}

#' @export
.DollarNames.from_path <- function(x, pattern) {
  list.files(x, pattern = pattern)
}

#' @export
.DollarNames.from_fn <- function(x, pattern) {
  list.files(x(), pattern = pattern)
}

#' @export
print.from_path <- function(x) {
  attributes(x) <- NULL
  NextMethod()
}
#
# from_where_factory <- function(x, root) {
#   structure(
#     function(...) {
#       root <-
#       new_from_path(
#         file.path(root, ...)
#       )
#     },
#     class = "from_where"
#   )
# }
