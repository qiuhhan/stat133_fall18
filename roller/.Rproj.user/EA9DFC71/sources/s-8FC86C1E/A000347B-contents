#' @title Make Rolled Object
#' @description Constructor function for object "roll"
#' @param coin object of class device
#' @param flips object of class flips
make_roll <- function(device, flips) {
  res <- list(
    rolls = flips,
    sides = device$sides,
    prob = device$prob,
    total = length(flips))
  class(res) <- "roll"
  res
}



#' @export
"[<-.roll" <- function(x, i, value) {
  if (all(x$sides != value)) {
    stop(paste('\nreplacing value must be one of', x$sides))
  }
  if (i > length(x$rolls)) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  x
}


#' @export
"[.roll" <- function(x, i) {
  # extraction method for objects of class "roll"
  x$rolls[i]
}


#' @export
"+.roll" <- function(obj, incr) {
  # addition method for class "roll"
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament")
  }
  more_rolls <- flip(obj, times = incr)
  obj$rolls <- c(obj$rolls, more_rolls)
  obj$total <- length(obj$rolls)
  obj
}
