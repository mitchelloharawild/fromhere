# fromhere (development version)

## Initial Release

The `fromhere` package helps construct relative file paths from specific project roots.

`fromhere` provides two main methods for generating file paths relative to the root of various project types:

1. **Using functions:** `from_rproj("path/to/file")`

   Using strings to specify file paths, allowing a more programmatic approach to building paths.

2. **Using `$` for autocompletion:** `from_rproj$path$to$file`

   This method allows for a more interactive approach to specifying file paths, where the autocompletion is relative to the `from_*` folder.

This initial release supports file paths from many common project types:

- `from_wd()`: For paths relative to the working directory.
- `from_here()`: For paths relative to the [`{here}`](https://here.r-lib.org/) package's automatic project root.
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
- `from_vcs()`: For generic version control root directories (Git or SVN).
- `from_testthat()`: For testthat directories.

The included vignette explains the nuances of organising files and specifying relative file paths to produce portable and reproducible projects.
