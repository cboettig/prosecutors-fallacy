


# Code for Prosecutors Fallacy 

Load the required libraries
 


```r
require(populationdynamics)
require(earlywarning)
require(reshape2)
require(snowfall)
```




Simulate a dataset from the full individual, nonlinear model, with stable parameters (*.e.g.* not approaching a bifurcation).



```r
select_crashes <- function(n){
	T<- 5000
	n_pts <- n
	pars = c(Xo = 500, e = 0.5, a = 180, K = 1000, h = 200,
    i = 0, Da = 0, Dt = 0, p = 2)
	sn <- saddle_node_ibm(pars, times=seq(0,T, length=n_pts), reps=1000)
	d <- dim(sn$x1)
	crashed <- which(sn$x1[d[1],]==0)
	sn$x1[,crashed] 
}
sfInit(parallel=TRUE, cpu=6)
```



```
R Version:  R version 2.15.0 (2012-03-30) 

```



```r
sfLibrary(populationdynamics)
```



```
Library populationdynamics loaded.
```



```r
sfExportAll()
examples <- sfLapply(1:16, function(i) select_crashes(50000))
dat <- melt(as.matrix(as.data.frame(examples, check.names=FALSE)))
names(dat) = c("time", "reps", "value")
save(list=ls(), file="crashed.rda")
```




Zoom in on the relevant area of data near the crash



```r
require(plyr)
zoom <- ddply(dat, "reps", function(X){
    tip <- min(which(X$value==0))
    index <- max(tip-300,1):tip
    data.frame(time=X$time[index], value=X$value[index])
    })
zoom <- subset(zoom, value > 300)
save("zoom", file="zoom.rda")
```




A plot of the first 9 datasets over the interval used for the warning signal calculation.



```r
load("zoom.rda")
require(ggplot2)
ggplot(subset(zoom, reps %in% levels(zoom$reps)[1:9])) + geom_line(aes(time, value)) + facet_wrap(~reps, scales="free")
```

![plot of chunk replicate_crashes](http://farm8.staticflickr.com/7037/7133603721_1e42985acf_o.png) 


Compute model-based warning signals on all each of these.  




```r
load("zoom.rda")
L <- length(unique(zoom$reps))
sfLibrary(earlywarning)
```



```
Library earlywarning loaded.
```



```r
sfExportAll()
models <- sfLapply(unique(zoom$rep), function(i)
  try(stability_model(zoom[zoom$rep==i, c("time", "value")], "LSN"))
)
save("models", file="models.rda")
```




Load the resulting data and compute indicators:



```r
load("zoom.rda")
load("models.rda")
require(plyr)
require(earlywarning)
indicators <- ddply(zoom, "reps", function(X){
    Y <- data.frame(time=X$time, value=X$value)
    tau_var <- warningtrend(Y, window_var)
    tau_acorr <- warningtrend(Y, window_autocorr)
    i <- X$rep[1]
    m <- models[[i]]$pars["m"]
    c(var=tau_var, acor=tau_acorr, m=m)
})
```




Plot distribution of indicators



```r
require(reshape2)
dat <- melt(indicators, id="reps")
ggplot(subset(dat, variable != "m.m")) + geom_histogram(aes(value)) + facet_wrap(~variable)
```

![plot of chunk indicators](http://farm9.staticflickr.com/8003/6987519442_b17aab38e6_o.png) 


Beanplot version of the indicators



```r
require(beanplot)
beanplot(value ~ variable, data=dat, what=c(0,1,0,0), bw="nrd0")
```

![plot of chunk beanplot](http://farm9.staticflickr.com/8015/6987519692_35187d9305_o.png) 

```r
save(list=ls(), file="ProsecutorsFallacy.rda")
```






