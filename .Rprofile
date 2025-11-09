# Disable completion from the language server
options(
  languageserver.server_capabilities =
    list(completionProvider = FALSE, completionItemResolve = FALSE)
)
# options(device = httpgd::hgd)
options(device = terminalgraphics::tgp, term_col = TRUE)
if (interactive() || isatty(stdout())) {
    options(colorout.verbose = 1)
    if (require("colorout", quietly = FALSE)) {
        # Gruvbox color scheme by @sjlva
        colorout::setOutputColors(
            index    = "\x1b[38;2;158;206;106m",
            normal   = "\x1b[38;2;86;95;137m",
            number   = "\x1b[38;2;211;134;155m",
            negnum   = "\x1b[38;2;104;157;106m",
            zero     = "\x1b[38;2;69;133;136m",
            infinite = "\x1b[38;2;250;189;47m",
            string   = "\x1b[38;2;184;187;38m",
            date     = "\x1b[38;2;254;128;25m",
            const    = "\x1b[38;2;250;189;47m",
            true     = "\x1b[38;2;142;192;124m",
            false    = "\x1b[38;2;251;73;52m",
            warn     = "\x1b[38;2;250;189;47m",
            stderror = "\x1b[38;2;204;36;29m",
            error    = "\x1b[38;2;204;36;29m",
            verbose  = FALSE
        )
    }
}
