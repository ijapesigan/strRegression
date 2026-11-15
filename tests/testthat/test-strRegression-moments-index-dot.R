## ---- test-strRegression-moments-index-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        out <- strRegression:::.MomentsIndex(p = 2)
        testthat::expect_equal(
          object = names(x = out),
          expected = c("sigmaysq", "sigmayx", "vechsigmacapx", "muy", "mux")
        )
        testthat::expect_equal(
          object = out$sigmayx,
          expected = c("sigmayx1", "sigmayx2")
        )
        testthat::expect_equal(
          object = out$vechsigmacapx,
          expected = c("sigmax1x1", "sigmax2x1", "sigmax2x2")
        )
        testthat::expect_equal(object = out$mux, expected = c("mux1", "mux2"))
        testthat::expect_equal(
          object = strRegression:::.MomentsIndex(p = 1)$vechsigmacapx,
          expected = "sigmax1x1"
        )
      }
    )
  },
  text = "test-strRegression-moments-index-dot"
)
