#' @title device
#' @description Creates an object of class device
#' @param sides vector of device
#' @param prob vector of probabilities
#' @return an object of class device
#' @export
device = function(sides = c(1, 2), prob = c(0.5, 0.5)) {
  check_sides(sides)
  check_prob(prob)
  if (length(sides) != length(prob)) {
    stop("\n'sides' and 'prob' have different lengths")
  }

  object = list(
    sides = sides,
    prob = prob)
  class(object) = "device"
  object
}

#' @title check_sides
#' @description function that checks vector of sides
#' @param sides
#' @return TRUE/FALSE
check_sides = function(sides) {
  if (length(sides) < 2) {
    stop("\n'sides' must be a vector with more than one element")
  }
  if (any(duplicated(sides))) {
    stop("\n'sides' cannot contain duplicated elements")
  }
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}

#' @title check_prob
#' @description function that checks vector of prob
#' @param prob
#' @return TRUE/FALSE
check_prob = function(prob) {
  if (length(prob) < 2) {
    stop("\n'prob' must be a vector with more than one element")
  }
  if (!is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector")
  }
  if (any(prob < 0) | (any(prob > 1))) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}

#' @title print.device
#' @description print device information in an organized manner
#' @param x
#' @return print sides and probability of device
#' @export
print.device = function(x, ...) {
  cat('object "device"\n\n')
  cat(sprintf('%s  %s', 'side prob', "\n"))
  for (i in 1:length(x$sides)){
    cat(sprintf('%s  %s', x$sides[i], x$prob[i]), "\n")
    invisible(x)
  }

}


#' @title is.device
#' @description check ifinput is a device
#' @param x
#' @return TRUE/FALSE
#' @export
is.device <- function(x) {
  if (is(x, "device")){
    return(TRUE)
  }
  return(FALSE)
}
