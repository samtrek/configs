# Disable completion from the language server
options(
  languageserver.server_capabilities =
    list(completionProvider = FALSE, completionItemResolve = FALSE)
)
# options(device = httpgd::hgd)
options(device = terminalgraphics::tgp, term_col = TRUE)
if (interactive() || isatty(stdout())) {
    options(colorout.verbose = 1)
    if (require("colorout", quietly = TRUE)) {
        # Gruvbox color scheme by @sjlva
    colorout::setOutputColors(
  
  index    = 15, # gray
  normal   = 4, # text

  number   = 166, # blue
  negnum   = 168, # red 
  zero     = 6,# light blue
  infinite = 5, # pink

  string   = 71, # yellow
  date     = 58, # text
  const    = 16, # orange,
  
  true     = 2, # green
  false    = 1, # red

  warn     = 16, # orange
  stderror = 1, # red
  error = 1, # red

  verbose  =  FALSE
)
    }
}
colorout::addPattern(' chr ', '22')
