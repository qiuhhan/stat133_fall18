#' @title count-vowels
#' @description computes the number of vowels in both lower
#' and upper case letters of a character string
#' @param x a string
#' @return numbers of vowels
library('stringr')

count_vowels = function(x) {
  if ((typeof(x) != "character") & (length(x) == 1)) {
    stop("invalid input; a string was expected")
  } else {
    x = tolower(x)
    counts = c(str_count(x, pattern = "a"),
               str_count(x, pattern = "e"),
               str_count(x, pattern = "i"),
               str_count(x, pattern = "o"),
               str_count(x, "u"))
    counts = as.double(counts)
    names(counts) = c("a","e","i","o","u")
  }
  return(counts)
}
