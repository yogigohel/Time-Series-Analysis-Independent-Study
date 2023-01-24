library(ggfortify)
library(astsa)

# Problem 1.3
## a)
w <- rnorm(150)
x <- filter(w, filter=c(0, -.9), method="recursive")[-(1:50)]
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (a)", facets = F, alpha=0.8)

## b)
f <- cos(2*pi*(1:100)/4)
x <- filter(f, filter=c(0, -.9), method="recursive")
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (b)", facets = F, alpha=0.8)

## c)
fw <- f+w
x <- filter(fw, filter=c(0, -.9), method="recursive")
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (c)", facets = F, alpha=0.8)
