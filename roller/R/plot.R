#' @title Plot of object rolled
#' @description Plots the relative frequencies of a series of rolls
#' @param x an object of class \code{"roll"}
#' @param side number indicating which side of device to consider
#' @export
plot.rolls <- function(x, ...) {
  freqs <- prop.table(table(x$rolls))
  barplot(freqs, border = NA, las = 1,
          xlab = "sides of device",
          ylab = "relative frequencies")
  title(sprintf("Relative Frequencies in a series of %s rolls", length(x$rolls)))
}
