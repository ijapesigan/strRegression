## ---- test-strRegression-jac-beta-star-wrt-vech-sigma-dot
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
        jcap <- strRegression:::.JacBetaStarWRTVechSigma(
          beta = f$beta,
          sigmay = sqrt(x = 0.89),
          sigmax = sqrt(x = diag(x = f$sigmacapx)),
          invsigmacapx = solve(a = f$sigmacapx),
          p = 2,
          k = 3
        )
        num <- numDeriv::jacobian(func = function(v) {
          strRegression:::.BetaStarofVechSigma(vechsigmacap = v, k = 3)
        }, x = f$vechsigmacap)
        testthat::expect_equal(object = dim(x = jcap), expected = c(2, 6))
        testthat::expect_equal(
          object = unname(obj = jcap),
          expected = unname(obj = num),
          tolerance = 1e-6
        )
        testthat::expect_equal(
          object = rownames(x = jcap),
          expected = c("betastar1", "betastar2")
        )
        sigmacap1 <- matrix(data = c(4, 1, 1, 2), nrow = 2)
        jcap1 <- strRegression:::.JacBetaStarWRTVechSigma(
          beta = 0.5,
          sigmay = 2,
          sigmax = sqrt(x = 2),
          invsigmacapx = matrix(data = 0.5),
          p = 1,
          k = 2
        )
        num1 <- numDeriv::jacobian(func = function(v) {
          strRegression:::.BetaStarofVechSigma(vechsigmacap = v, k = 2)
        }, x = sigmacap1[lower.tri(x = sigmacap1, diag = TRUE)])
        testthat::expect_equal(
          object = unname(obj = jcap1),
          expected = unname(obj = num1),
          tolerance = 1e-6
        )
      }
    )
  },
  text = "test-strRegression-jac-beta-star-wrt-vech-sigma-dot"
)
