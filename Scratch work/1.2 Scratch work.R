library(ggplot2)
library(ggfortify)
library(astsa)
set.seed(1)

#(a)
s_a=c(integer(100), 10*exp(-(1:100)/20)*cos(2*pi*1:100/4))
x_a=s_a+rnorm(200)
autoplot(as.ts(x_a))

#(b)
s_b=c(integer(100), 10*exp(-(1:100)/200)*cos(2*pi*1:100/4))
x_b=s_b+rnorm(200)
autoplot(as.ts(x_b))

#(c)
mod_a=exp(-(1:100)/20)
mod_b=exp(-(1:100)/200)
modulators<-as.ts(cbind(mod_a,mod_b))
autoplot(modulators,facets=F,main="Modulators (a) and (b)")
         
#Work for chapter notes
##1.8
w=rnorm(500)
autoplot(as.ts(w), main="White Noise", xlab="t", ylab="wt", ylim=c(-4,4))
##1.9
v=filter(w, sides=2, filter=rep(1/3,3))
autoplot(as.ts(v), main="Moving Average", xlab='t', ylab="yt", ylim=c(-4,4))
##1.10
w=rnorm(510)
x=filter(w, filter=c(1,-.9), method = "recursive")[-(1:10)]
autoplot(as.ts(x), main="Autoregression", xlab="t", ylab="xt")
##1.11
w=rnorm(200)
d=0.2
x=cumsum(w)
wd=w+d
xd=cumsum(wd)
comparison=cbind(x,xd)
autoplot(as.ts(comparison),facets=F,main="Random Walks")
