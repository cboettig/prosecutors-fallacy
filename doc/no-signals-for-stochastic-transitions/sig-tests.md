


```r
opts_chunk$set(comment = NA)
download.file("https://raw.github.com/cboettig/earlywarning/resubmission/inst/doc/Figure1.csv", 
    dest = "Figure1.csv", method = "curl")
dat <- read.csv("Figure1.csv")
```


(there should be some clever way in plyr or data.table to do these combinations automatically, but anyway)




Focusing on the OU model, we do see some 'significant' difference in autocorrelation distributions:


```r
x <- subset(dat, variable == "Autocorrelation" & data == "null" & model == "OU")$value
y <- subset(dat, variable == "Autocorrelation" & data == "conditional" & model == 
    "OU")$value
wilcox.test(x, y, alternative = "less")  # x - y < 0 since y bigger than x
```

```

	Wilcoxon rank sum test with continuity correction

data:  x and y
W = 135229, p-value = 0.01158
alternative hypothesis: true location shift is less than 0
```

```r
ks.test(x, y, alternative = "greater")  # CDF x > then CDF y since more weight to the left
```

```
Warning: p-value will be approximate in the presence of ties
```

```

	Two-sample Kolmogorov-Smirnov test

data:  x and y
D^+ = 0.1114, p-value = 0.03007
alternative hypothesis: the CDF of x lies above that of y
```


Variances are more different:


```r
x <- subset(dat, variable == "Variance" & data == "null" & model == "OU")$value
y <- subset(dat, variable == "Variance" & data == "conditional" & model == "OU")$value
wilcox.test(x, y, alternative = "less")  # x - y < 0 since y bigger than x
```

```

	Wilcoxon rank sum test with continuity correction

data:  x and y
W = 112149, p-value = 3.409e-08
alternative hypothesis: true location shift is less than 0
```

```r
ks.test(x, y, alternative = "greater")  # CDF x > then CDF y since more weight to the left
```

```
Warning: p-value will be approximate in the presence of ties
```

```

	Two-sample Kolmogorov-Smirnov test

data:  x and y
D^+ = 0.2333, p-value = 2.107e-07
alternative hypothesis: the CDF of x lies above that of y
```



Clearer for Allee case:


```r
x <- subset(dat, variable == "Variance" & data == "null" & model == "Allee")$value
y <- subset(dat, variable == "Variance" & data == "conditional" & model == "Allee")$value
wilcox.test(x, y, alternative = "less")  # x - y < 0 since y bigger than x
```

```

	Wilcoxon rank sum test with continuity correction

data:  x and y
W = 25599, p-value < 2.2e-16
alternative hypothesis: true location shift is less than 0
```

```r
ks.test(x, y, alternative = "greater")  # CDF x > then CDF y since more weight to the left
```

```
Warning: p-value will be approximate in the presence of ties
```

```

	Two-sample Kolmogorov-Smirnov test

data:  x and y
D^+ = 0.7732, p-value < 2.2e-16
alternative hypothesis: the CDF of x lies above that of y
```


We opt not to include a comparison statistic since it is unclear to me what is most appropriate.  Wilcox test is a bit of a strange choice given the skew of the conditional distribution.  Kolmogorov-Smirnov is slightly more natural, but really hard to defend either one in this context, as distributions of Kendall's $\tau$ statistics is already a somewhat curious distribution - ideally we should consider how it should actually be distributed given the dynamical process as the null (which is what we generate numerically).  

