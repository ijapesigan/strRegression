## ---- test-strRegression-jac-delta-r-sq-wrt-theta-star-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        for (p in 1:3) {
          jj <- .JacFixture(p = p)
          num <- numDeriv::jacobian(func = function(t) {
            r <- .RhoFromTheta(t = t, p = p)
            r$betastar^2 / diag(x = solve(a = r$rhocapx))
          }, x = jj$theta)
          out <- strRegression:::.JacDeltaRSqWRTThetaStar(
            betastar = jj$betastar,
            rhocapx = jj$rhocapx
          )
          testthat::expect_equal(
            object = dim(x = out),
            expected = c(p, 2 * p + 1 + p * (p - 1) / 2)
          )
          testthat::expect_equal(
            object = unname(obj = out),
            expected = unname(obj = num),
            tolerance = 1e-6
          )
        }
      }
    )
  },
  text = "test-strRegression-jac-delta-r-sq-wrt-theta-star-dot"
)
