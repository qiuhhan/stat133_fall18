library(testthat)

context("Check device arguments")

test_that("check_sides with ok vectors", {

  expect_true(check_sides(c('h', 't')))
  expect_true(check_sides(c(1, 2)))
})


test_that("check_sides with valid(first two) and invalid(last two) lengths", {

  expect_true(check_sides(c('one', 'two', 'three')))
  expect_true(check_sides(1:5))
  expect_error(check_sides(c('one')))
  expect_error(check_sides(1))
})



test_that("check_sides fails with duplications", {

  expect_error(check_sides(c('one', 'one')))
  expect_error(check_sides(c('one', 'one')),
               "\n'sides' cannot contain duplicated elements")
})


test_that("check_prob works with ok vectors", {

  expect_true(check_prob(c(0.5, 0.5)))
  expect_true(check_prob(c(0, 1)))
  expect_true(check_prob(c(1, 0)))
  expect_true(check_prob(c(0.1, 0.9)))
  expect_true(check_prob(c(1/3, 2/3)))
  expect_true(check_prob(c(1/6, 5/6)))
})


test_that("check_prob fails with invalid lengths", {
  expect_error(check_prob(1))
  expect_error(check_prob(0.8))
  expect_error(check_prob(0))
})


test_that("check_prob fails with invalid numbers", {
  expect_error(check_prob(0.7, 0.8))
  expect_error(check_prob(1:5))
  expect_error(check_prob(0.333, 0.666))
  expect_error(check_prob(-0.5, 0.5))
  expect_error(check_prob(0.7, -0.8, 0.3))
  expect_error(check_prob(0.5, NA))
  expect_error(check_prob(0.2, 0.5, 0.4))
})


test_that("is.device with ok devices", {
  expect_true(is.device(device(sides = c('i', 'ii', 'iii', 'iv'), prob = rep(1/4, 4))))
  expect_true(is.device(device(sides = 1:6,prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))))
})

test_that("is.device with invalid devices", {
  expect_error(is.device(device(sides = c('heads', 'heads'))))
  expect_error(is.device(device(sides = c('a', 'b'), prob = c(0.2, 0.1))))
  expect_error(is.device(device(sides = c('a', 'b', 'c'), prob = c(0.2, 0.8))))
  expect_false(is.device(c(1, 2, 3)))
})

