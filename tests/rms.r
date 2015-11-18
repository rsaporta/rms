require(rms)
N <- 100
set.seed(1)
time <- rexp(N)
status <- sample(0:1, N, replace = TRUE)
S <- Surv(time, status)
x1 <- gl(2, 50)
x2 <- runif(N)
# Makes last colname x1 %ia% x2 which is really inconsistent:
model.matrix(~ x1 + rcs(x2) + x1 %ia% x2)
x3 <- c(rep('A', 33), rep('B', 33), rep('C', 34))
# Makes last 2 colnames x3 %ia% x2x3=B * x2,  x3 %ia% x2x3=C * x2
model.matrix(~ x3 + rcs(x2) + x3 %ia% x2)
cph(S ~ x3 + rcs(x2) + x3 %ia% x2)

ols(time ~ x1 + rcs(x2) + x1 %ia% x2)
lrm(status ~ x1 + rcs(x2) + x1 %ia% x2)
options(debug=TRUE,width=110)
cph(S ~ x1 + rcs(x2) + x1 %ia% rcs(x2))
cph(S ~ x1 + rcs(x2) + x1 %ia% x2)

cph(S ~ x1 * rcs(x2))