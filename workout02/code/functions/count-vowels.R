#' @title count-vowels
#' @description computes the number of vowels in both lower
#' and upper case letters of a character string
#' @param x a string
#' @return numbers of vowels
library(stringr)

count_vowels = function(x) {
  num = nchar(x)
  lower = tolower(x)
  vowels = c('a', 'e', 'i', 'o', 'u')
  split = str_split(as.vector(lower), "")
  
  j = 1
  a = 0
  e = 0
  i = 0
  o = 0
  u = 0
  
  if (typeof(x) != "character") {
    stop("ERROR")
  } else {
    while (j < num + 1) {
      if (split[[1]][j] == vowels[1]) {
        a = a + 1
        j = j + 1
      } else if (split[[1]][j] == vowels[2]) {
        e = e + 1
        j = j + 1
      } else if (split[[1]][j] == vowels[3]) {
        i = i + 1
        j = j + 1
      } else if (split[[1]][j] == vowels[4]) {
        o = o + 1
        j = j + 1
      } else if (split[[1]][j] == vowels[5]) {
        u = u + 1
        j = j + 1
      } else {
        j = j + 1
      }
    }
    count = c(a, e, i, o, u)
    return(count)
  }
}
