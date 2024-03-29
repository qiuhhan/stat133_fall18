

context("Tests for minkowski()")


test_that("minkowski works as expected", {
  point1 = c(0,0)
  point2 = c(1,1)
  point3 = sqrt(c(2,2))
  point4 = c(0,1)
  point5 = c(1,1,1)
  
  expect_equal(minkowski(point1, point2, p = 1), 2)
  expect_equal(minkowski(point1, point3, p = 2), 2)
  expect_equal(minkowski(point1, point2, p = "max"), 1)
  
  expect_length(minkowski(point1, point2, p = 1), 1)
  expect_type(minkowski(point1, point2, p = 1), "double")
  
  expect_error(minkowski(point4, point5, p = 1))
  expect_error(minkowski(point1, point2, p = 0.5))
  expect_error(minkowski(point1, point2, p = "min"))
})
