## ---- test-strRegression-p-cor-sq-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        testthat::expect_equal(
          object = strRegression:::.PCorSq(srsq = c(0.1, 0.2), rsq = 0.5),
          expected = c(0.1 / 0.6, 0.2 / 0.7)
        )
        testthat::expect_equal(
          object = strRegression:::.PCorSq(srsq = 0.3, rsq = 0.3),
          expected = 0.3
        )
      }
    )
  },
  text = "test-strRegression-p-cor-sq-dot"
)
