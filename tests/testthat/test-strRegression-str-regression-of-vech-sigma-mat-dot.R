## ---- test-strRegression-str-regression-of-vech-sigma-mat-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    # compiled code is not available when the R scripts are only sourced
    message(text)
    if (exists(x = "_strRegression_StrRegressionofVechSigmaMat")) {
      testthat::test_that(
        desc = paste(text, "agrees with the R functions"),
        code = {
          f <- .StrFixture()
          bad <- f$vechsigmacap
          bad[1] <- -1
          vechsigmacap <- rbind(f$vechsigmacap, bad, f$vechsigmacap)
          out <- .StrRegressionofVechSigmaMat(
            vechsigmacap = vechsigmacap,
            k = 3
          )
          testthat::expect_equal(
            object = names(x = out),
            expected = c("betastar", "rsq", "spcor", "pcorsq")
          )
          testthat::expect_equal(
            object = out$betastar[1, ],
            expected = f$betastar
          )
          testthat::expect_equal(
            object = out$rsq[c(1, 3)],
            expected = rep(x = f$rsq, times = 2)
          )
          testthat::expect_equal(
            object = out$spcor[3, ]^2,
            expected = f$srsq
          )
          testthat::expect_equal(
            object = out$pcorsq[1, ],
            expected = f$srsq / (1 - (f$rsq - f$srsq))
          )
          testthat::expect_true(
            object = all(is.na(x = out$betastar[2, ])) &&
              is.na(x = out$rsq[2]) &&
              all(is.na(x = out$spcor[2, ])) &&
              all(is.na(x = out$pcorsq[2, ]))
          )
          out1 <- .StrRegressionofVechSigmaMat(
            vechsigmacap = rbind(c(4, 1, 2)),
            k = 2
          )
          testthat::expect_equal(
            object = out1$betastar[1, 1],
            expected = 0.5 * sqrt(x = 2) / 2
          )
          testthat::expect_equal(
            object = out1$rsq[1],
            expected = 1 / 8
          )
          testthat::expect_equal(
            object = out1$spcor[1, 1]^2,
            expected = out1$rsq[1]
          )
        }
      )
    }
  },
  text = "test-strRegression-str-regression-of-vech-sigma-mat-dot"
)
