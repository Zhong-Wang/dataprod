---
title       : Very Simple Interactive Plot
subtitle    : 1967 - 2007 US Population
author      : Zhong Wang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Appllication Summary

The economic dataset is included in the ggplot2 package. It contains US economics data during Jun 1967 to Mar 2007, such as data regarding personal savings rate, personal consumption expenditure, median duration of unemployment, unemployed population and total population.[1]

Through this very simple interactive application, user can
* Choose a specific time period for plotting
* Pick which population date to be shown

1. [R document - US economic time series.](http://docs.ggplot2.org/current/economics.html)

--- .class #id 

## Data Summary

The total population and unemployed population data are summarised as follows


```r
library(ggplot2)
data(economics)
```
Summary of Total Population (in millions)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     199     220     243     246     272     302
```
Summary of Unemployed Population (in millions)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    2.68    6.05    7.19    7.00    8.25   12.10
```

--- &twocol

## Population Plot

The red line in the plot is total population, and the blue line is unemployed population

*** =left

[Application Site](http://zhong-wang.shinyapps.io/shinyapp/)

```
qplot(date, pop, data=economics, 
geom="blank") + xlab("Years") +
ylab("Population (in millions)") +
ylim(0, max(economics$pop)) +
geom_line(aes(y=pop), colour="red") +
geom_line(aes(y=unemploy), colour="blue")
```

*** =right

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4.png) 

--- .class #id

## Observation

* Total population in the US steadily increases during 1967 to 2007
* Unemployed population in the US remains at the same level over the time
* It doesn't seem a strong positive correlation between total population and unemployed population

  * The correlation between two populations is 0.4123
  
* The unemployment ratio (unemployed population / total population) gradually declines
