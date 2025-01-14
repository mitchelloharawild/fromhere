# /tmp/testdir
# ├── git_repo
# │   ├── data
# │   │   └── data.csv
# │   ├── r_package
# │   │   ├── DESCRIPTION
# │   │   ├── R
# │   │   ├── data
# │   │   │   └── input.csv
# │   │   └── tests
# │   │       └── testthat
# │   │           └── test-example.R
# │   └── standalone_analysis
# │       ├── analysis.Rproj
# │       ├── data
# │       │   └── dataset.csv
# │       ├── results
# │       └── scripts
# │           └── analysis.R
# └── project.Rproj

test_that("paths from r package", {
  setwd(file.path(temp_dir, "git_repo", "r_package"))
  expect_equal(
    as.character(from_r_package()),
    getwd()
  )
  expect_equal(
    as.character(from_testthat()),
    file.path(temp_dir, "git_repo", "r_package", "tests", "testthat")
  )
  expect_equal(
    as.character(from_git()),
    file.path(temp_dir, "git_repo")
  )
  expect_equal(
    as.character(from_rproj()),
    file.path(temp_dir)
  )
  expect_equal(
    as.character(from_rproj("git_repo", "data", "input.csv")),
    file.path(temp_dir, "git_repo", "data", "input.csv")
  )
  expect_equal(
    as.character(from_git("data", "input.csv")),
    file.path(temp_dir, "git_repo", "data", "input.csv")
  )
  expect_equal(
    from_r_package("data/input.csv"),
    from_r_package$data$input.csv
  )
  expect_error(
    from_targets(),
    "No root directory found"
  )
})


test_that("paths from git folder", {
  setwd(file.path(temp_dir, "git_repo"))
  expect_equal(
    as.character(from_git()),
    file.path(temp_dir, "git_repo")
  )
  expect_equal(
    as.character(from_rproj()),
    file.path(temp_dir)
  )
  expect_equal(
    as.character(from_rproj("git_repo", "data", "input.csv")),
    file.path(temp_dir, "git_repo", "data", "input.csv")
  )
  expect_equal(
    as.character(from_git("data", "input.csv")),
    file.path(temp_dir, "git_repo", "data", "input.csv")
  )
  expect_error(
    from_r_package(),
    "No root directory found"
  )
  expect_error(
    from_testthat(),
    "No root directory found"
  )
})
