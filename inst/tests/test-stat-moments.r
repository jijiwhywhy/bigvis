context("Stat: moments")

count2 <- function(x) compute_moments(x)[1]
mean2 <- function(x) compute_moments(x)[2]
var2 <- function(x) compute_moments(x)[3]

test_that("count agrees with length", {
  expect_equal(count2(1:10), 10)
  expect_equal(count2(5), 1)
  expect_equal(count2(numeric()), 0)
})

test_that("mean agree with base::mean", {
  expect_equal(mean2(1:10), mean(1:10))

  x <- runif(1e6)
  expect_equal(mean2(x), mean(x))
})

test_that("missing values are ignored", {
  x <- c(NA, 5, 5)
  expect_equal(count2(x), 2)
  expect_equal(mean2(x), 5)
})

test_that("variance agrees with var", {
  expect_equal(var2(1:10), var(1:10))

  x <- runif(1e6)
  expect_equal(var2(x), var(x))
})
