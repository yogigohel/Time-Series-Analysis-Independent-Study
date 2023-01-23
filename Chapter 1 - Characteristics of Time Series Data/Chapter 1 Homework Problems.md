### Problem 1.1
---
```R
library(ggplot2)

hw1<-cbind(EXP6,EQ5)
colnames(hw1)<-c("Explosion","Volcano")
autoplot(hw1, facets = FALSE, alpha = 0.75)
```
![[HW 1.1.svg]]

### Problem 1.2
---
##### (a)
```R
library(ggplot2)
library(ggfortify)
set.seed(1)

s=c(integer(100), 10*exp(-(1:100)/20)*cos(2*pi*1:100/4))
x_a=s+rnorm(200)
autoplot(as.ts(x_a))
```
![[HW 1.2 (a).svg]]

##### (b)
```R
s=c(integer(100), 10*exp(-(1:100)/200)*cos(2*pi*1:100/4))
x_b=s+rnorm(200)
autoplot(as.ts(x_b))
```
![[HW 1.2 (b).png]]
##### (c)
The explosion series is similar to series **a**, and the earthquake series is similar to series **b** in their mid-to-end behavior. We see that both series **a** and the explosion series have big amplitudes in the middle that slowly become smaller and tend towards 0 but don't get there. We also see that both series **b** and the earthquake have big amplitudes throughout their mid-to-end behavior.
```R
mod_a=exp(-(1:100)/20)
mod_b=exp(-(1:100)/200)
modulators<-as.ts(cbind(mod_a,mod_b))
autoplot(modulators,facets=F,main="Modulators (a) and (b)")
```
![[HW 1.2 (c).png]]
### Problem 1.3
---
##### (a)
```R
library(ggfortify)
library(astsa)

w <- rnorm(150)
x <- filter(w, filter=c(0, -.9), method="recursive")[-(1:50)]
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (a)", facets = F, alpha=0.8)
```
![[HW 1.3 (a).svg]]
##### (b)
```R
f <- cos(2*pi*(1:100)/4)
x <- filter(f, filter=c(0, -.9), method="recursive")
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (b)", facets = F, alpha=0.8)
```
![[HW 1.3 (b).svg]]
##### (c)
```R
fw <- f+w
x <- filter(fw, filter=c(0, -.9), method="recursive")
v <- filter(x, rep(1/4, 4), sides = 1)
autoplot(as.ts(cbind(x, v)), main = "Problem 1.3 (c)", facets = F, alpha=0.8)
```
![[HW 1.3 (c).svg]]
##### (d)

### Problem 1.4
---
Show the following:
$$
\mathbf{E}[(x_{s}-\mu_{s})(x_{t}-\mu_{t})]=\mathbf{E}[x_{s}x_{t}]-\mu_{s}\mu_{t}
$$
Proof:
> $$\mathbf{E}[(x_{s}-\mu_{s})(x_{t}-\mu_{t})]=\mathbf{E}[x_{s}x_{t}-x_{s}\mu_{t}-x_{t}\mu_{s}+\mu_{s}\mu_{t}]=\mathbf{E}[{x_{s}x_{t}}]-\mu_{t}\mathbf{E}[x_{s}]-\mu_{s}\mathbf{E}[x_{t}]+\mu_{s}\mu_{t}$$
> $$\mathbf{E}[{x_{s}x_{t}}]-\mu_{t}\mu_{s}-\mu_{s}\mu_{t}+\mu_{s}\mu_{t}=\mathbf{E}[x_{s}x_{t}]-\mu_{s}\mu_{t}$$
> $$\implies \mathbf{E}[(x_{s}-\mu_{s})(x_{t}-\mu_{t})]=\mathbf{E}[x_{s}x_{t}]-\mu_{s}\mu_{t}$$

### Problem 1.5
---
##### (a) ![[HW 1.5 (a).svg]]
##### (b) ![[HW 1.5 (b).svg]]