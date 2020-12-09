
match.arg <- function(arg, choices, several.ok = FALSE)
{
  # if the value "choices" is not specified, then the formal arguments'
  # of the parent function are called 
  if (missing(choices)) {
    formal.args <- formals(sys.function(sysP <- sys.parent()))
    # the choices are set with arguments of the parent funciton
    choices <- eval(formal.args[[as.character(substitute(arg))]],
                    envir = sys.frame(sysP))
  }
  # if the given argument is NULL, then the first entry of choices will be returned
  if (is.null(arg)) return(choices[1L])
  
  # if the argument isn't of thy type character it will be stopped
  else if (!is.character(arg))
    stop("'arg' must be NULL or a character vector")
  
  # if the argument several.ok is not FALSE (default), then it can either be (input checking):
  # 1. argument and choices are the same: return argument
  # 2. the length of the argument is greater 1: stopping
  # 3. the length of the argument is 0: stopping
  if (!several.ok) { 
    if (identical(arg, choices)) return(arg[1L])
    if (length(arg) > 1L) stop("'arg' must be of length 1")
  } else if (length(arg) == 0L) stop("'arg' must be of length >= 1")
  
  # handle each element of arg separately
  # i: matching arg against choices; returning the amount of matches including duplicates
  i <- pmatch(arg, choices, nomatch = 0L, duplicates.ok = TRUE)
  # if there are no matches: stopping
  if (all(i == 0L))
    stop(gettextf("'arg' should be one of %s",
                  paste(dQuote(choices), collapse = ", ")),
         domain = NA)
  # set i to elemente greater 0
  i <- i[i > 0L]
  # if several.ok TRUE and length of i greater 1: stopping
  if (!several.ok && length(i) > 1)
    stop("there is more than one match in 'match.arg'")
  # return: the choices with matched elements
  choices[i]
}

make_something <- function(something = c("mess", "cake", "hyuuge mistake")) {
  something <- match.arg(something)
  message("I made a", something, ".\n")
}

debugonce(match.arg)
make_something(c("hyuuge"))




