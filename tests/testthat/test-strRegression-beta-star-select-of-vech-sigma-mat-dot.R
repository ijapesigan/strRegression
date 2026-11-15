## ---- test-strRegression-beta-star-select-of-vech-sigma-mat-dot
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
        betastar <- rbind(c(x1 = 0.4, x2 = 0.3), c(x1 = 0.2, x2 = 0.1))
        vechsigmacap <- rbind(f$vechsigmacap, f$vechsigmacap)
        out <- strRegression:::.BetaStarSelectofVechSigmaMat(
          betastar = betastar,
          vechsigmacap = vechsigmacap,
          k = 3,
          std_y = FALSE,
          std_x = c(TRUE, FALSE)
        )
        expected <- t(x = apply(X = betastar, MARGIN = 1, FUN = function(b) {
          strRegression:::.BetaStarSelect(
            betastar = b,
            sigmay = sqrt(x = 0.89),
            sigmax = c(1, sqrt(x = 2)),
            std_y = FALSE,
            std_x = c(TRUE, FALSE)
          )
        }))
        testthat::expect_equal(
          object = unname(obj = out),
          expected = unname(obj = expected)
        )
        testthat::expect_equal(
          object = colnames(x = out),
          expected = c("x1", "x2")
        )
        testthat::expect_equal(
          object = unname(
            obj = strRegression:::.BetaStarSelectofVechSigmaMat(
              betastar = betastar,
              vechsigmacap = vechsigmacap,
              k = 3,
              std_y = TRUE,
              std_x = c(TRUE, TRUE)
            )
          ),
          expected = unname(obj = betastar)
        )
      }
    )
  },
  text = "test-strRegression-beta-star-select-of-vech-sigma-mat-dot"
)
