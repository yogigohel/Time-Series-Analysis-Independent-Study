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
##### (a) 
```R
mean_x1 <- c(integer(100), 10*exp(-(1:100)/20)*cos(2*pi*1:100/4))
x1 <- mean_x1 + rnorm(200)
autoplot(as.ts(cbind(x1,mean_x1)), main = "Problem 1.5 (a); Modulator t/20", facets = F, alpha=0.7)
```
![[HW 1.5 (a)(i).svg]]

```R
mean_x2 <- c(integer(100), 10*exp(-(1:100)/200)*cos(2*pi*1:100/4))
x2 <- mean_x2 + rnorm(200)
autoplot(as.ts(cbind(x2,mean_x2)), main = "Problem 1.5 (a); Modulator t/200", facets = F, alpha=0.7)
```
![[HW 1.5 (a)(ii).svg]]
##### (b) 

### Problem 1.6
---
##### (a) 
No, $x_t$ is not stationary because it fails the first requirment, that is $$E[x_t]=E[\beta_1+\beta_2t+w_t]=E[\beta_1]+E[\beta_2t]+E[w_t]=\beta_1+\beta_2t$$ which is dependent on time and that is not allowed in stationary time series.
##### (b)
In order to be stationary we need to satisfy two requirements which we show below.
1.) The mean function is not dependent on time.
$$E[y_t] = E[x_t - x_{t-1}] = E[x_t] - E[x_{t-1}] = E[\beta_1+\beta_2t + w_t - \beta_1-\beta_2(t-1)-w_{t-1}] = \beta_2$$
2.)
##### (c)
The mean of the moving average is:$$E[v_t]=E[\frac{1}{2q+1}\sum_{j=-q}^{q}x_{t-j}]=\frac{1}{2q+1}(2q+1)E[x_t]=E[x_t]=\beta_1+\beta_2t$$
The simplified expression for the covariance is:

### Problem 1.8
---
##### (a)
$x_0=0$
$x_1 = \delta + w_1,$
$x_2=\delta+(\delta+w_1)+w_2=2\delta+\sum_{k=1}^2w_k$
$x_3=\delta+(2\delta+\sum_{k=1}^2w_k)+w_2=3\delta+\sum_{k=1}^3w_k$
... (By Induction)
$x_{t} = \delta + ((t-1)\delta+\sum_{k=1}^{t-1}w_{k})+w_t = t\delta+\sum_{k=1}^{t}w_{k}$

##### (b)
$$E[x_t]=E[t\delta+\sum_{k=1}^tw_k]=E[t\delta]+E[\sum_{k=1}^tw_k]=t\delta$$
$$cov(x_s,x_t)=E[(s\delta+\sum_{k=1}^{s}w_{k}-s\delta)(t\delta+\sum_{k=1}^{t}w_{k}-t\delta)]=E[(\sum_{k=1}^{s}w_{k})(\sum_{k=1}^{t}w_{k})]=0$$(the last equality is from the fact that expectation of two IID random variables multiplied is the product of each of their expectations and when we simplify that we should get a lot of sums of products of $w_k$ terms which all have mean 0)
## Need to check this -- it doesn't feel correct.

##### (c)
$x_t$ is not stationary because the mean function is not time homogeneous so it doesn't satisfy the 1st condition of stationarity.

##### (d)

##### (e)