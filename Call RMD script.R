library(rmarkdown)
rmarkdown::render("README.Rmd", output_file = "Wedneday_Report.md", params = list(day = "Wednesday"), envir = new.env())


