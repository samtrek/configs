local({
  r = getOption("repos")
  r["CRAN"]  <-  "https://cran.rstudio.com"
  options(repos = r)
})
.First <- function() {
        if(interactive()){
                library(utils)
                timestamp(, prefix = paste("##------ [", getwd(), "] ", sep = ""))
        }
}
if(Sys.getenv("TERM") == "xterm-256color"){
 library("colorout")

}
options(max.print=100)

q <- function (save="no", ...) {
  quit(save=save, ...)
}

options(editor =  "nvim")

options(
    languageserver.server_capabilities = list(
        signatureHelpProvider = list(
                triggerCharacters = list("(")
        ) 
    )
)
