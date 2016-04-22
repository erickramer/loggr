# ```loggr```: Bringing the pipe to logging since 2016

```loggr``` tries to make logging in R easier. It lets you mix logging statements naturally with the ```%>%``` operator from [magrittr](https://github.com/smbache/magrittr). 

It also comes with some nice features -- flags, verbosity settings, redirecting logs to a file -- that come in handy when deploying R in production.  

# Installation

The easiest install is with with [devtools](https://github.com/hadley/devtools)

```r
library(devtools)
install_github("erickramer/loggr")
```

# Features

```loggr``` comes with some useful features. Check out these examples.

## Pipeable syntax
Mix logging statements with your code. ```loggr``` always returns its first argument, which makes it easy to use with the pipe.

```r
iris_filtered = iris %>%
    loggr("I'm a fan of logging") %>%
    filter(Species == "setosa") %>%
    loggr("Like a really big fan")
```

Access the first argument of the function with ```.```

```r
iris_filtered = iris %>%
    loggr("I see you have", nrow(.), "rows") %>%
    filter(Species == "setosa") %>%
    loggr("And now you have", nrow(.), "rows")
```

## Capture the flag
Add flags to your logs.
```r
iris_filtered = iris %>%
    loggr("Look at these logs!", .flags=c("flag1", "flag2") %>%
    filter(Species == "setosa")
```

Or set flags globally
```r
loggr_flags("foo", "bar")
```

## Set levels of importance
Use ```loggr_level``` to set the vebosity level for your logs (ascending is *less* verbose). You can keep your script the same and just change one parameter to set how many logging statements you see.
```r
loggr_level(5)

iris_filtered = iris %>%
    loggr("This message isn't so important", .level=1) %>%
    filter(Species == "setosa") %>%
    loggr("But this one is", .level=10)
```


## Redirect to a file

```r
open_log("mylog.txt")

iris_filtered = iris %>%
    loggr("This is going to a file!") %>%
    filter(Species == "setosa")
    
close_log()
```
