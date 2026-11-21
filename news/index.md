# Changelog

## strRegression 0.0.2

### Other changes

- The linearAlgebra copies refreshed from linearAlgebra 0.0.5 and the
  rhoMatrix copy from rhoMatrix 0.0.3 (`.DMat()` faster, same results;
  named examples).

## strRegression 0.0.1

### Initial release

- The rProject template; private `jeksterslab-psu/strRegression`, public
  `ijapesigan/strRegression`.
- Complete roxygen for every function; internal functions use `@noRd`.
- C++ moves to `.setup/cpp/` with `Makevars`, `Makevars.win`, and
  `000-forward-declarations.cpp`.
- Locked copies of the functions from `linearAlgebra` (`.Vec()`,
  `.Vech()`, `.Vechs()`, `.SymofVech()`, `.VechNames()`,
  `.VechsNames()`, `.DiagofVech()`, `.DMat()`, and the C++
  `SymofVechCpp()`) and from `rhoMatrix` (`.RhoofSigma()`).
- `.StrRegressionofVechSigmaMat()` (C++): `k` is passed by const
  reference (`cpp-const-ref`); the result is unchanged.
- `.SigmaSq()` gets `@noRd` (it had no `@noRd`, so it would have written
  a help page).
- Tests for every function.

### Fixes

- `.BetaStarofVechSigma()` stopped with “argument "q" is missing” (it
  did not pass `q` to `.BetaStarofSigma()`); it now passes
  `q = 1 / sqrt(diag(sigmacap))`. Regression test in
  `test-strRegression-beta-star-of-vech-sigma-dot.R`.
- `.JacVechSigmaWRTThetaRSq()` put the elements of the columns for
  `vech(Sigma_X)` in the wrong order (the first column of the block was
  `c(Sigma_X beta, beta' Sigma_X beta / rsq)`, not
  `c(beta' Sigma_X beta / rsq, Sigma_X beta)`), so the Jacobian
  disagreed with `.JacVechSigmaWRTTheta(rsq = )` and with numerical
  differentiation. Regression test in
  `test-strRegression-jac-vech-sigma-wrt-theta-r-sq-dot.R`.
