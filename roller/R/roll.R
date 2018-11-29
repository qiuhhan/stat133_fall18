#' @title Roll a device
#' @description Creates an object of class "rolls"
#' @param device object of class "device"
#' @param times number of times to roll the device (default value of 1)
#' @return an object of class "rolls" with the following elements:
#' @return rolls vector of rolls
#' @return sides vector of device "sides"
#' @return prob vector of device "prob"
#' @return total total number of rolls(i.e. times)
#' @export
roll <- function(device, times = 1) {
  check_times(times)
  flips <- flip(device, times = times)
  make_roll(device, flips)
}


#' @title check_times
#' @description function to check vector of 'times'
#' @param times integer
#' @return TRUE/FALSE
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}


# private function
#' @export
flip <- function(x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}

#' @title rolls
#' @description print rolls as a chart
#' @param list
#' @return chart
print.roll <- function(x, ...) {
  cat('object "rolls"\n\n')
  cat(sprintf("%s", '$rolls\n'))
  print(x$rolls)
  invisible(x)
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}
