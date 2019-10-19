test_that("is_first_argument returns TRUE if the first argument, false otherwise", {
  env <- new.env()

  env$linebuffer <- ''
  expect_false(is_first_argument(env), FALSE)

  env$linebuffer <- 'fun('
  expect_true(is_first_argument(env))

  env$linebuffer <- 'fun(foo'
  expect_true(is_first_argument(env))

  env$linebuffer <- 'fun("foo'
  expect_true(is_first_argument(env))

  env$linebuffer <- 'fun(foo='
  expect_false(is_first_argument(env))

  env$linebuffer <- 'fun(foo = '
  expect_false(is_first_argument(env))

  env$linebuffer <- 'fun(foo = "bar"'
  expect_false(is_first_argument(env))

  env$linebuffer <- 'fun(bar,'
  expect_false(is_first_argument(env))
})

test_that("current_function returns the current function, `\"\"` otherwise", {
  env <- new.env()

  env$linebuffer <- ''
  expect_equal(current_function(env), "")

  env$linebuffer <- 'fun('
  expect_equal(current_function(env), "fun")

  env$linebuffer <- 'fun(foo = '
  expect_equal(current_function(env), "fun")

  env$linebuffer <- 'fun(foo=T, bar = "xyz/'
  expect_equal(current_function(env), "fun")

  env$linebuffer <- 'fun(foo = bar == "xyz/'
  expect_equal(current_function(env), "fun")

  env$linebuffer <- 'foo = "bar", baz = "qux'
  expect_equal(current_function(env), "")

  env$linebuffer <- 'foo = bar == "xyz/'
  expect_equal(current_function(env), "")

  env$linebuffer <- 'foo(bar(baz = "xyz/'
  expect_equal(current_function(env), "bar")

  env$linebuffer <- 'foo(); bar(baz = "xyz/'
  expect_equal(current_function(env), "bar")
})
