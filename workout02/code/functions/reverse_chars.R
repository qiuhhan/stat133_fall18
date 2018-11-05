#' @title reverse_chars
#' @description reverses a string by characters.
#' @param x unreversed
#' @return reversed

library(stringr)

reverse_chars = function(x) {
  num = nchar(x)
  y = as.vector(str_split(x, ""))
  n = c()
  for (i in seq(0, num-1, 1)){
    n = c(n, y[[1]][num-i])
    q = str_c(n, sep = '"', collapse = "")
  }
    return(q)
}
