## ---- test-strRegression-jac-vech-sigma-wrt-theta-dot
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
        func <- function(t) {
          strRegression:::.Vech(
            x = strRegression:::.SigmaofTheta(
              beta = t[1:2],
              sigmasq = t[3],
              sigmacapx = strRegression:::.SymofVech(x = t[4:6], k = 2)
            )
          )
        }
        theta <- c(
          f$beta,
          0.4,
          f$sigmacapx[lower.tri(x = f$sigmacapx, diag = TRUE)]
        )
        out <- strRegression:::.JacVechSigmaWRTTheta(
          beta = f$beta,
          sigmacapx = f$sigmacapx,
          q = 6,
          p = 2
        )
        testthat::expect_equal(object = dim(x = out), expected = c(6, 6))
        testthat::expect_equal(
          object = unname(obj = out),
          expected = unname(obj = numDeriv::jacobian(func = func, x = theta)),
          tolerance = 1e-6
        )
        testthat::expect_equal(
          object = rownames(x = out)[1:3],
          expected = c("sigmaysq", "sigmayx1", "sigmayx2")
        )
        fixed <- strRegression:::.JacVechSigmaWRTTheta(
          beta = f$beta,
          sigmacapx = f$sigmacapx,
          q = 6,
          p = 2,
          fixed_x = TRUE
        )
        testthat::expect_equal(object = dim(x = fixed), expected = c(6, 3))
        testthat::expect_equal(
          object = unname(obj = fixed),
          expected = unname(obj = out[, 1:3])
        )
        func_rsq <- function(t) {
          sx <- strRegression:::.SymofVech(x = t[4:6], k = 2)
          b <- t[1:2]
          sxb <- as.vector(x = sx %*% b)
          strRegression:::.Vech(
            x = rbind(c(sum(b * sxb) / t[3], sxb), cbind(sxb, sx))
          )
        }
        theta_rsq <- c(
          f$beta,
          0.4,
          f$sigmacapx[lower.tri(x = f$sigmacapx, diag = TRUE)]
        )
        out_rsq <- strRegression:::.JacVechSigmaWRTTheta(
          beta = f$beta,
          sigmacapx = f$sigmacapx,
          q = 6,
          p = 2,
          rsq = 0.4
        )
        testthat::expect_equal(
          object = unname(obj = out_rsq),
          expected = unname(
            obj = numDeriv::jacobian(func = func_rsq, x = theta_rsq)
          ),
          tolerance = 1e-6
        )
        testthat::expect_equal(
          object = colnames(x = out_rsq)[3],
          expected = "rsq"
        )
      }
    )
  },
  text = "test-strRegression-jac-vech-sigma-wrt-theta-dot"
)
