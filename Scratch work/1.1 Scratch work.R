library(astsa)
library(ggplot2)
library(reshape2)
library(ggfortify)
library(xts)

autoplot(jj)

autoplot(fmri1[,2:5], facets = FALSE, ylab="BOLD Signal Intensity")
autoplot(fmri1[,6:9], facets= FALSE, ylab="BOLD Signal Intensity")

djiR<-diff(log(djia$Close))[-1]
autoplot(djiR, xlab = "Time", ylab = "Return")

autoplot(globtempl, xlab = "Year", ylab = "Temp Deviations")

head(EXP6)
data.class(EXP6)

hw1<-cbind(EXP6,EQ5)
colnames(hw1)<-c("Explosion","Volcano")
autoplot(hw1, facets = FALSE, alpha = 0.75)

