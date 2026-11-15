## ---- test-strRegression-jac-theta-star-wrt-vech-sigma-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        f <- .StrFixture()
        jcap <- strRegression:::.JacThetaStarWRTVechSigma(
          beta = f$beta,
          sigmay = sqrt(x = 0.89),
          sigmax = sqrt(x = diag(x = f$sigmacapx)),
          invsigmacapx = solve(a = f$sigmacapx),
          p = 2,
          k = 3
        )
        num <- numDeriv::jacobian(func = function(v) {
          c(
            strRegression:::.BetaStarofVechSigma(vechsigmacap = v, k = 3),
            sqrt(x = v[c(1, 4, 6)])
          )
        }, x = f$vechsigmacap)
        testthat::expect_equal(object = dim(x = jcap), expected = c(5, 6))
        testthat::expect_equal(
          object = unname(obj = jcap),
          expected = unname(obj = num),
          tolerance = 1e-6
        )
        testthat::expect_null(object = rownames(x = jcap))
      }
    )
  },
  text = "test-strRegression-jac-theta-star-wrt-vech-sigma-dot"
)
