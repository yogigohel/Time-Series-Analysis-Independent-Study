### Problem 1.1
---
```R
library(ggplot2)

hw1<-cbind(EXP6,EQ5)
colnames(hw1)<-c("Explosion","Volcano")
autoplot(hw1, facets = FALSE, alpha = 0.75)
```
![[HW 1.1.png]]

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
![[HW 1.2 (a).png]]

##### (b)
```R
s=c(integer(100), 10*exp(-(1:100)/200)*cos(2*pi*1:100/4))
x_b=s+rnorm(200)
autoplot(as.ts(x_b))
```
![[HW 1.2 (b).png]]
##### (c)
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
##### (b)
##### (c)
##### (d)