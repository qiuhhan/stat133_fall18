#' @rdname roll
#' @param x an object "roll"
#' @param further arguments ignored
#' @export
summary.rolls <- function(x, ...) {
  freqs <- table(x$rolls)
  relative_freqs <- prop.table(freqs)
  roll_freqs <- as.data.frame(cbind(
    side = x$sides,
    count = freqs,
    prop = relative_freqs))
  obj <- list(freqs = roll_freqs)
  class(obj) <- "summary.rolls"
  obj
}


#' @export
print.summary.rolls <- function(x, ...) {
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}

