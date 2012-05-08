
# Model-based detection of early warning under a delay

What happens when we attempt to fit the linear change model to a signal in which the environment is initially constant and then begins degrading?

First let's simulate some such data



```r
require(populationdynamics)
```



```r
require(earlywarning)
```


```r
pars = c(Xo = 500, e = 0.5, a = 180, K = 1000, 
    h = 200, i = 0, Da = 0.5, Dt = 50, p = 2)
sn <- saddle_node_ibm(pars, times = seq(0, 100, 
    length = 200))
X <- ts(sn$x1, start = sn$time[1], deltat = sn$time[2] - 
    sn$time[1])
```




Observe that this produces timeseries has 200 points in the interval `(0,100)` with a linear change begining half way through, at `Dt=50`, where it begins approaching a saddle-node bifurcation.  Let's fit both our models:



```r
A <- stability_model(X, "OU")
B <- stability_model(X, "LSN")
```



```r
observed <- -2 * (logLik(A) - logLik(B))
observed
```



```
## [1] 2.343
```




... and then use the bootstrapped likelihood ratios to see if this difference is significant:



```r
require(snowfall)
```




```r
sfInit(parallel = TRUE, cpu = 16)
sfLibrary(earlywarning)
```


```r
sfExportAll()
reps <- sfLapply(1:100, function(i) compare(A, 
    B))
lr <- lik_ratios(reps)
roc <- roc_data(lr)
save(list = ls(), file = "delayed.rda")
```







Is this a concern for the windowed approach?  It still complicates the calculation of the correlation statistic used to demonstrate a statistically significant increase.  We certainly would not advocate choosing the region "by eye" as it were where the increase appears and then testing the correlation on that segment alone -- that would guarentee bias.  In principle this faces the same problem that the starting point needs to be known in advance.  