# Magic!

if (interactive()) {
	# Graphics
	options(menu.graphics = FALSE)

	# Packages
	local({r <- getOption("repos")
		r["CRAN"] <- "https://ftp.fau.de/cran/"
		options(repos=r)
	})
	is.installed <- function(pkg) {
	    nzchar(system.file(package = pkg))
	}

	BOOTSTRAP <- function() {
		if (!is.installed("devtools")) {
		        install.packages("devtools")
		}

		# REPL! Colorful!
		if (!is.installed("colorout")) {
			library(devtools)
			devtools::install_github("jalvesaq/colorout")
		}
	}

	if (is.installed("colorout")) {
		library(colorout)
	}
}

