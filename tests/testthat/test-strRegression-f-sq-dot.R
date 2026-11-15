## ---- test-strRegression-f-sq-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        out <- strRegression:::.FSq(
          rsq = 0.5,
          spcor = rbind(c(x1 = 0.3, x2 = 0.4))
        )
        testthat::expect_equal(
          object = colnames(x = out),
          expected = c("fsq", "x1", "x2")
        )
        testthat::expect_equal(
          object = unname(obj = out),
          expected = rbind(c(1, 0.18, 0.32))
        )
        out2 <- strRegression:::.FSq(
          rsq = c(0.2, 0.5),
          spcor = rbind(c(a = 0.1), c(a = 0.3))
        )
        testthat::expect_equal(
          object = unname(obj = out2),
          expected = rbind(c(0.25, 0.0125), c(1, 0.18))
        )
      }
    )
  },
  text = "test-strRegression-f-sq-dot"
)
