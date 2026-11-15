## ---- test-strRegression-jac-beta-star-sel-wrt-theta-star-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        betastar <- c(0.4, 0.3)
        for (std_y in c(TRUE, FALSE)) {
          jcap <- strRegression:::.JacBetaStarSelWRTThetaStar(
            betastar = betastar,
            sigmay = 2,
            sigmax = c(1, 4),
            std_y = std_y,
            std_x = c(TRUE, FALSE)
          )
          num <- numDeriv::jacobian(func = function(t) {
            strRegression:::.BetaStarSelect(
              betastar = t[1:2],
              sigmay = t[3],
              sigmax = t[4:5],
              std_y = std_y,
              std_x = c(TRUE, FALSE)
            )
          }, x = c(betastar, 2, 1, 4))
          testthat::expect_equal(object = dim(x = jcap), expected = c(2, 5))
          testthat::expect_equal(
            object = unname(obj = jcap),
            expected = unname(obj = num),
            tolerance = 1e-6
          )
        }
      }
    )
  },
  text = "test-strRegression-jac-beta-star-sel-wrt-theta-star-dot"
)
