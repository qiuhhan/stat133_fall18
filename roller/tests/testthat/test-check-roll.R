library(testthat)

context("Check roller arguments")

test_that("check_times with vectors", {

  expect_error(check_times("twenty"))
  expect_error(check_times(4,9,6,7))
  expect_error(check_times(0))
  expect_true(check_times(2))
  expect_true(check_times(10 + 9))
  expect_true(check_times(10 * 4^5))
})


test_that("is.roll with roll vectors", {

  expect_error(is.roll(roll(device(), 0)))
  expect_error(is.roll(roll(device(sides = c("tic", "tac", "toe"), prob = c(0.1, 0.4, 0.5)), -7)))
  expect_true(is.roll(roll(device(sides = 1:6, prob = rep(1/6, 6)), times = 50)))
  expect_true(is.roll(roll(device(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)), times = 20)))
})


test_that("flip with device and time", {

  expect_equal(length(flip(device(), 532)), 532)
  expect_error(length(flip(device(), -1)))
  expect_true(flip(device(), 1) == 1|2)
})


test_that("roll with device and time", {
  expect_error(roll(device(c("a"), 100)))
  expect_true(class(roll(device(), 7)) == "roll")
})


test_that("roll with device and time", {
  expect_error(summary.rolls(device(c("a"), 1)))
  expect_equal(class(summary.rolls(device(c("a","b"), c(0.4, 0.6)))), "summary.rolls")
  expect_type(summary.rolls(device(c("a","b"), c(0.4, 0.6))), "list")
})


