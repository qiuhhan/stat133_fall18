#' @title is_hex()
#' @description checks whether an input string is a valid color in
#' hexadecimal notation without an alpha transparency
#' @param hex a string
#' @return TRUE or FALSE

library('stringr')

is_hex = function(hex) {
  num = nchar(hex)
  hex2 = as.vector(tolower(hex))
  if (typeof(hex) != "character") {
    stop("invalid input; a string was expected")
  } else if (((num == 7) == TRUE) & (str_detect(hex2, "#[0-f][0-f][0-f][0-f][0-f][0-f]")) == TRUE) {
    return(TRUE)
  } else{
    return(FALSE)
  }
}


#' @title is_hex_alpha()
#' @description checks whether an input string is a valid color in
#' hexadecimal notation with an alpha transparency
#' @param hexa a string
#' @return TRUE or FALSE

is_hex_alpha = function(hexa) {
  num = nchar(hexa)
  hexa2 = as.vector((tolower(hexa)))
  if (typeof(hexa) != "character") {
    stop("invalid input; a string was expected")
  } else if ((num == 9) == TRUE & (str_detect(hexa2, "#[0-f][0-f][0-f][0-f][0-f][0-f][0-f][0-f]")) == TRUE) {
    return(TRUE)
  } else{
    return(FALSE)
  }
}