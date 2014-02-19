The Prosecutor's Fallacy
==========================

Author: Carl Boettiger <cboettig@gmail.com>


Installation
------------

#### Requirements

* R (>= 2.15)
* R packages: `devtools,` `ggplot2`, `odesolve`, `reshape2`, `psych`, and `plyr`
* Install the package for generating the simulations

```r
require(devtools)
install_github("populationdynamics", "cboettig")
```

**Note:** Several of the examples use code parallelized for multiple processors.  If your machine has greater/fewer than the specified number of cpus available, modify the cpu settings in the code for optimal performance. Several of the examples may take several days to run on 16 processor machines specified in the code.   


Reproducible code for the analysis
----------------------------------

All code 

* [Code for analysis and plotting in Figure 1](https://github.com/cboettig/earlywarning/blob/prosecutor/inst/examples/bd_curves.md)
* [Code for the analysis and plotting in Figure 2](https://github.com/cboettig/earlywarning/blob/prosecutor/inst/examples/fallacy.md)
* [Code for the analysis and plotting in Figure 3](https://github.com/cboettig/earlywarning/blob/prosecutor/inst/examples/may.md)

### Source code for example files

Examples are written in the dynamic document format [knitr](http://yihui.name/knitr), which combines R code with rich formatting markup describing methods, results, and displaying figures.  Source code for these files can be found in the `.Rmd` file of the same name in the same directory.  A complete reproducible example can be generated by running the `knit` function on any of the corresponding `.Rmd` files.  
