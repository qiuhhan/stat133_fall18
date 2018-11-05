#' @title Minkowski Distance
#' @description calculates Minkowski distance of given two points
#' @param x numeric vector for one point
#' @param y numeric vector for the other point
#' @return either a numeric value greater than 1, or a character string max (default 1)

minkowski = function(x, y, p = 1){
  if (length(x) != length(y)) {
    stop("x and y have different lengths")
  } else if (p < 1){
    stop("p cannot be less than 1")
  } else if (typeof(p) == 'character' & p != "max"){
    stop("invalid character value for p")
  } else if (p != "max") {
    s = 0
    for (i in seq(1, length(x))) {
      s = (abs(x[i] - y[i]))^(p) + s
    } 
    return ((s)^(1/p))
  } else if (p == "max") {
    vector = c()
    for (i in seq(1, length(x))) {
      vector = c(vector, abs(x[i] - y[i]))
    }
    return(max(vector))
  }
}

