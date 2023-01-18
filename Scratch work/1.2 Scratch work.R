library(ggplot2)
library(ggfortify)

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
         
cbind()