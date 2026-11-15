## ---- test-strRegression-jac-vech-sigma-wrt-theta-star-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        for (p in 1:2) {
          jj <- .JacFixture(p = p)
          sigmay <- jj$theta[p + 1]
          sigmax <- jj$theta[p + 1 + seq_len(length.out = p)]
          func <- function(t) {
            r <- .RhoFromTheta(t = t, p = p)
            d <- diag(x = r$sigmax, nrow = p)
            sx <- d %*% r$rhocapx %*% d
            syx <- r$sigmay * as.vector(x = d %*% r$rhocapx %*% r$betastar)
            strRegression:::.Vech(x = rbind(c(r$sigmay^2, syx), cbind(syx, sx)))
          }
          q <- 2 * p + 1 + p * (p - 1) / 2
          out <- strRegression:::.JacVechSigmaWRTThetaStar(
            betastar = jj$betastar,
            sigmay = sigmay,
            sigmax = sigmax,
            rhocapx = jj$rhocapx,
            q = q,
            p = p
          )
          testthat::expect_equal(object = dim(x = out), expected = c(q, q))
          testthat::expect_equal(
            object = unname(obj = out),
            expected = unname(
              obj = numDeriv::jacobian(func = func, x = jj$theta)
            ),
            tolerance = 1e-6
          )
        }
      }
    )
  },
  text = "test-strRegression-jac-vech-sigma-wrt-theta-star-dot"
)
