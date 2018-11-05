#' @title is_hex()
#' @description checks whether an input string is a valid color in
#' hexadecimal notation without an alpha transparency
#' @param x a string
#' @return TRUE or FALSE

library(stringr)

is_hex = function(hex) {
  num = nchar(hex)
  hex_split = str_split(as.vector(tolower(hex)), "")
  if (typeof(hex) != "character") {
    stop("invalid input; a string was expected")
  } else if (num == 7 & hex_split[[1]][1] == "#") {
    for (i in seq(2,7)) {
      if ((str_detect(hex_split[[1]][i], "[O-f]")) == FALSE){
        return (FALSE)
      } else{
        return(TRUE)
      }
    }
  } else {
     return(FALSE)
}
}

#' @title is_hex_alpha()
#' @description checks whether an input string is a valid color in
#' hexadecimal notation with an alpha transparency
#' @param x a string
#' @return TRUE or FALSE

is_hex_alpha = function(x) {
  
}