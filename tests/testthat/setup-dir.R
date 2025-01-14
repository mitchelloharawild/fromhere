# Create a temporary directory for testing
temp_dir <- normalizePath(tempdir(), winslash = "/")

# Define folder structure
project_structure <- list(
  "git_repo" = list(
    ".git" = list(),
    "data" = list(
      "data.csv" = "a,b\n5,6\n7,8"
    ),
    "r_package" = list(
      "DESCRIPTION" = "Package: r_package",
      "data" = list(
        "input.csv" = "sample,data\n1,2\n3,4"
      ),
      "R" = list(),
      "tests" = list(
        "testthat" = list(
          "test-example.R" = "# Example test file"
        )
      )
    ),
    "standalone_analysis" = list(
      "scripts" = list(
        "analysis.R" = "# Analysis script"
      ),
      "data" = list(
        "dataset.csv" = "x,y\n9,10\n11,12"
      ),
      "results" = list(),
      "analysis.Rproj" = "Version: NA"
    )
  ),
  "project.Rproj" = "Version: NA"
)

# Recursive function to create the structure
create_structure <- function(base_path, structure) {
  for (name in names(structure)) {
    path <- file.path(base_path, name)
    if (is.list(structure[[name]])) {
      dir.create(path, showWarnings = FALSE, recursive = TRUE)
      create_structure(path, structure[[name]])
    } else {
      writeLines(structure[[name]], path)
    }
  }
}

# Create the structure in the temporary directory
create_structure(temp_dir, project_structure)

