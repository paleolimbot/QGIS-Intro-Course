
# renders all documents in the Tutorial_markdown folder to the Tutorials folder
tutorial_render_all <- function(output_dir, ...) {
  # set alternate working directory and cleanup at the end
  # or else a lot of empty folders are created
  original_working_dir <- getwd()
  # check for absolute versus relative path for output_dir
  if(!grepl("^/.*", output_dir)) {
    output_dir <- file.path(getwd(), output_dir)
  }
  rmds <- list.files("Tutorial_markdown", "*.Rmd", full.names = TRUE)
  rmds <- file.path(getwd(), rmds)
  
  working_dir <- tempfile()[1]
  dir.create(working_dir)
  setwd(working_dir)
  
  on.exit({
    setwd(original_working_dir)
    unlink(working_dir, recursive = TRUE)
  })
  
  # render all the markdown files
  vapply(rmds, rmarkdown::render, output_dir = output_dir, ..., FUN.VALUE = character(1))
} 

# creates a skeleton for tutorial .Rmd files from a folder of images
tutorial_rmd_skeleton <- function(directory, rmd_file_name, title, output_type = "github_document",
                                  overwrite = FALSE) {
  
  # check if the directory exists
  if(!dir.exists(directory)) stop(directory, " does not exist")
  
  # strip the tailing slash off the directory
  directory <- gsub("/$", "", directory)
  
  # set default rmd filename
  if(missing(rmd_file_name)) {
    rmd_file_name <- paste0(directory, ".Rmd")
  }
  
  # set default title
  if(missing(title)) {
    title <- basename(directory)
  }
  
  # check if file already exists
  if(!overwrite && file.exists(rmd_file_name)) stop("File ", rmd_file_name, " already exists")
  
  # define header template
  rmd_template_head <- "
---
title: \"{title}\"
---



"
  
  # define image template
  image_template <- "![{image_title}]({image_file})"
  
  # get image files from directory
  image_files <- list.files(directory, pattern = "(*.?\\.jpg)|(*.?\\.png)|(*.?\\.jpeg)", 
                           full.names = FALSE, recursive = TRUE)
  image_file <- file.path(basename(directory), image_files)
  
  # strip extensions
  image_title <- stringr::str_replace(image_files, paste0("\\.", tools::file_ext(image_files)), "")
  
  # glue and paste image templates
  image_templates <- glue::glue(image_template, "\n\n\n\n")
  

  # write to file
  write(c(glue::glue(rmd_template_head), image_templates), rmd_file_name)
}
