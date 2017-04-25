
# source RMD tutorial functions
source("R/tutorial_rmd_skeleton.R")

build_release <- function(out = "../QGIS-Intro.zip", overwrite = FALSE) {
  if(grepl("\\.zip$", out)) {
    # make sure out doesn't exist
    if(!overwrite && file.exists(out)) stop(out, " already exists")
    
    # out_directory is a tempfile here
    out_directory <- tempfile()[1]
    on.exit(unlink(out_directory, recursive = TRUE))
    zipfile <- out
  } else {
    # make sure out_directory doesn't exist
    out_directory <- out
    if(overwrite && dir.exists(out_directory)) {
      unlink(out_directory, recursive = TRUE)
    } else if(dir.exists(out_directory)) {
      stop("Out directory already exists: ", out_directory)
    }
    
    zipfile <- NULL
  }
  
  # create the folder
  dir.create(out_directory)
  
  # generate a list of course material
  course_material <- list.files(recursive = TRUE)
  
  # remove files matching patterns in build_ignore.txt
  ignored_patterns <- gsub("\\\\", "\\", readLines("R/build_ignore.txt"), fixed = TRUE)
  ignored <- rep(FALSE, length(course_material))
  for(pattern in ignored_patterns) {
    ignored <- ignored | grepl(pattern, course_material)
  }
  course_material <- course_material[!ignored]
  
  # create all necessary folders in out_directory
  course_folders <- file.path(out_directory, setdiff(dirname(course_material), "."))
  for(folder in course_folders) {
    if(!dir.exists(folder)) dir.create(folder, recursive = TRUE)
  }
  
  # copy course material to out_directory
  file.copy(course_material, file.path(out_directory, course_material))
  
  # build tutorials to out_directory/Tutorials
  tutorial_render_all(file.path(out_directory, "Tutorials"),
                      output_format = rmarkdown::html_document(fig_caption = FALSE))
  
  # compress if out is a zip file
  if(!is.null(zipfile)) {
    
    # creating zip requires working directory to be set
    prev_wd <- getwd()
    if(!grepl("^/.*", zipfile)) {
      zipfile <- file.path(getwd(), zipfile)
    }
    
    # use utils::zip to compress
    setwd(out_directory)
    on.exit(setwd(prev_wd), add = TRUE)
    
    tmpzip <- "zipfile.zip"
    try(utils::zip(tmpzip, list.files(recursive = TRUE)))
    
    # move file to final location
    file.rename(tmpzip, zipfile)
    
    # make sure tmpzip doesn't exist
    try(unlink(tmpzip))
  }
  
  out
}

build_release()
