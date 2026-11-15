## ---- test-strRegression-theta-index-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        out <- strRegression:::.ThetaIndex(p = 2)
        testthat::expect_equal(
          object = names(x = out),
          expected = c("beta", "sigmasq", "vechsigmacapx", "beta0", "mux")
        )
        testthat::expect_equal(
          object = out$beta,
          expected = c("beta1", "beta2")
        )
        testthat::expect_equal(
          object = out$vechsigmacapx,
          expected = c("sigmax1x1", "sigmax2x1", "sigmax2x2")
        )
        testthat::expect_equal(
          object = strRegression:::.ThetaIndex(p = 1)$mux,
          expected = "mux1"
        )
      }
    )
  },
  text = "test-strRegression-theta-index-dot"
)
