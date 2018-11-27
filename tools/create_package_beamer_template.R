## create a template package for rmarkdown

setwd("C:/Users/Lenovo/Documents/MSc._EAGLE/latex_presentation_templates")

library(devtools)

# create package
create_package("templateHF")

# create directory for template
dir.create("templateHF/inst/rmarkdown/templates/report/skeleton",
           recursive = TRUE)

# create two important files
## a Rmd file "skeleton.Rmd" in the skeleton folder (this is your template file)
### a txt file "template.yaml" in the report  folder (this is your template metadata file,
### it makes sense to add a description of your template in the yaml file)

# install your package
setwd("C:/Users/Lenovo/Documents/MSc._EAGLE/latex_presentation_templates")
install.packages("templateHF")
library(templateHF)
# it is located here now: "C:\Users\Lenovo\Documents\R\win-library\3.5\templateHF"
## any changes have to be done there

# restart RStudio
# create a new rmarkdown file and use the template

## this is just very basic 
### Now you have to fill your template with parameters defining the appearance of your docs
#### And create also your own theme

###################################
# customize theme
#1 the default themes are located in "C:\Program Files\MiKTeX 2.9\tex\latex\beamer"
#2 your custom themes should be located in "C:\texlive\texmf-local\tex\latex\local"
# or equivalent
