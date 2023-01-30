library(ggfortify)
library(astsa)
set.seed(1)

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

# Problem 1.5
## a)
mean_x1 <- c(integer(100), 10*exp(-(1:100)/20)*cos(2*pi*1:100/4))
x1 <- mean_x1 + rnorm(200)
autoplot(as.ts(cbind(x1,mean_x1)), main = "Problem 1.5 (a); Modulator t/20", facets = F, alpha=0.7)

mean_x2 <- c(integer(100), 10*exp(-(1:100)/200)*cos(2*pi*1:100/4))
x2 <- mean_x2 + rnorm(200)
autoplot(as.ts(cbind(x2,mean_x2)), main = "Problem 1.5 (a); Modulator t/200", facets = F, alpha=0.7)