Base plotting packages: graphics - plot, hist, boxplot etc. grGraphics - X11, PDF, PNG etc.

Base graphics is a 2 phase process - 1. Initialise, 2. Annotate. 
 
plot() and hist() both can initialise a plot if one hasn't been initialised already. plot() is generic function that can be used if different ways, and will default if no data is supplied. The base graphics systems has lots of parameters that you can play around with using the par() function.

    library(datasets)
    hist(airquality$Ozone)
    with(airquality, plot(Wind, Ozone))

    airquality <- transform(airquality, Month = factor(Month))
    boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone(ppb)")
    title(main = "Ozone wind in city")

transform() changes data into a dataframe (or something)

    with(airquality, plot(Wind, Ozone, main="Ozone in the city"))
    with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))

type=n argument creates an empty plot, so you can add points after it's created.

    with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", 
                          type = "n"))
    with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
    with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
    legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

    with(airquality, plot(Wind, Ozone, main="Ozone in the city", pch=20))
    model <- lm(Ozone ~ Wind, airquality)
    abline(model, lwd=2)

lm() is used to fit linear models.

Multiple plots:
    
    par(mfrow = c(1,2))
    with(airquality, {plot(Solar.R, Ozone);plot(Wind, Ozone)})

head(airquality)
airquality$Solar.R


ggplot() is the core function and is flexible for doing things qplot() can’t.
    library(ggplot2)
    str(mpg)
    qplot(displ, hwy, data=mpg) # (x, y, data.frame)
    qplot(displ, hwy, data=mpg, color=drv) # note automatic legend
    qplot(displ, hwy, data=mpg, geom = c("point", "smooth"))
    qplot(hwy, data=mpg, fill=drv) # One dimension creates a histogram

ggplots have facets (similar to panels). facets takes a format with a cols ~ rows.

    qplot(displ, hwy, data=mpg, facets = . ~ drv)
    qplot(hwy, data=mpg, facets = drv ~ ., binwidth = 2)

Basic components:
    A data frame
    aesthetic mappings
    geoms - goemetric objects like lines or shapes
    facets - for conditional plots (?)
    stats - for statistical transformations like binning, quantiles, smoothing
    scales - e.g. red for female and blue for male.
    coordinate system

With ggplot, you can build a plot and add things on (similar to base). Plots are build in layers. Start with data, overlay a summary, add annotations and metadata.

    qplot(logpm25, NocturnalSympt, data=maacs, facets = . ~ bmicat, geom = c("point","smooth"),method="lm")

This creates two plot showing scatter plot of results, overlayed with trend lines. This uses the qplot function, but can also be built up, layer by layer with the ggplot() function.

    g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
    summary(g)

aes() generates aesthetic mappings. Trying to print(g) would throw error as no layers on plot. 

    p <- g + geom_point()
    print(p)

Adds the geom_point function to the data.

g + geom_point() auto prints

    g + geom_point() + geom_smooth(method = "lm")

"lm" gives a linear model regression line.

    g + goem_point() + facet_grid(. ~ bmicat) + geom_smooth(method = "lm")

Annotation: 

    * Labels: xlab(), ylab(), labs(), ggtitle()
    * Each of the geom functions has options to modify
    * For things that only make sense globally use theme()
    * Two standard themes: theme_gray(), theme_bw()

    g + geom_point(aes(color=bmicat), size=4, alpha= 0.5)

Note the color is assigned to a data variable requires the aes mapping. This will also generate the legend.

    testdat <- data.frame(x = 1:100, y=rnorm(100))
    testdat[50,2] <- 100 # Outlier
    plot(testdat$x, testdat$y, type="l", ylim=c(3,-3))

This cuts off that large outlier.

    g <- ggplot(testdat, aes(x=x, y=y))
    g + geom_line()

    g + geom_line() + ylim(-3,3) # hides the data point (subset the data to ignore it)
    g + geom_line() + coord_cartesian(ylim = c(-3,3)) # this one give you what you want




    set.seed(1234)
    par(mar = c(0,0,0,0))
    x <- rnorm(12, mean=rep(1:3, each=4), sd=0.2)
    y <- rnorm(12, mean=rep(c(1,2,1), each=4), sd=0.2)
    plot(x, y, col = "blue", pch = 19, cex = 2)
    text(x + 0.05, y + 0.05, labels = as.character(1:12))

    dataFrame = data.frame(x, y)
    kmeansObj <- kmeans(dataFrame, centers = 3)
    names(kmeansObj)

    par(mar = rep(0.2, 4))
    plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
    points(kmeansObj$centers, col=1:3, pch = 3, cex = 3, lwd = 3)


So the kmeans() function does all the work for you. cluster gives you the cluster each point is grouped by, so you can colour the points accordingly. centers gives you the centroids. 

Another way of visualising this is heat maps.

    set.seed(1234)
    dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
    kmeansObj2 <- kmeans(dataMatrix, centers = 3)
    par(mfrow = c(1,2), mar = c(2,4,0.1, 0.1))
    image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
    image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

Principal Component Analysis and Sigular Value Decomposition

Used in exploratory and modelling stages.

    set.seed(12345)
    par(mar = rep(0.2, 4))
    dm <- matrix(rnorm(400), nrow=40)
    image(1:10, 1:40, t(dm)[, nrow(dm):1])

THis just creates some noisy data. We can try to cluster the data using the heatmap function.

    heatmap(dm)

But is we have data with a pattern.

    set.seed(678910)
    for (i in 1:40){
        coinflip <- rbinom(1, size = 1, prob = 0.5)
        if(coinflip){
            dm[i,] <- dm[i,] + rep(c(0,3), each = 5)
        }
    }

So if we toss a coin and if the coin is a head, a common pattern is added to that row.

It creates a pattern to the data.

    image(1:10, 1:40, t(dm)[, nrow(dm):1])
    heatmap(dm)

    hh <- hclust(dist(dm))
    dmOrdered <- dm[hh$order,]
    par(mfrow = c(1,3))
    image(t(dmOrdered)[, nrow(dmOrdered):1])
    plot(rowMeans(dmOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch=19)
    plot(colMeans(dmOrdered), xlab = "Column", ylab = "Column Mean", pch=19)

Cluster analysis is useful for finding these patterns.

Related problems: you have multivariate variables X1...Xn

* Find a new set of that are uncorrellated and explain as much variance as possible.
* If you put the variables in one matrix, find the best matrix created with fewer variables (lower rank)that explains the original data.

I think this means coming up with generic categories that represent the typical data. e.g. categorising obese people by income, sex, race etc.

Singular Value Decomposition

SVD 

If X is a matrix with each column is a measurement and each row is an observation then the SVD is a matrix decomposition:

    X = UDV**T

Where the columns of U are orthogonal (left singular vectors) the columns of V are orthogonal (right singular vectors) and D is a diagonal matrix (singular values).

Principla Components Analysis

PCA

Uses the SVD. Take original data matrix and subtract the mean from each column and divide by the SD) the principle component will be equal to the right singular values (the V matrix).

http://en.wikipedia.org/wiki/Singular_value_decomposition

## U and V

    svd1 <- svd(scale(dmOrdered))
    par(mfrow = c(1,3))
    image(t(dmOrdered)[, nrow(dmOrdered):1])
    plot(svd1$u[,1], 40:1, , xlab = "Row", ylab = "First left singular vector", pch = 19)
    plot(svd1$v[,1], xlab = "Row", ylab = "First left singular vector", pch = 19)

## Variance Explained

This comes from the singular values in the dmatrix. Think of each singular value as the % of total variation in the dataset explained by that particular component.

You can plot the proportion of variance explained.

    par(mfrow=c(1,2))
    plot(svd1$d, xlab = "column", ylab = "Singular Value", pch = 19)
    plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)

First plot just shows the raw values, but doesn't have much meaning. Divide by the total sums, to get a proportion.

### Relationship to principle components

The relationship between the singular values decomp and the principal components is close. Here we plot

    svd1 <- svd(scale(dmOrdered))
    pca1 <- prcomp(dmOrdered, scale = TRUE)
    plot(pca1$rotation[,1], svd1$v[,1], pch = 19, xlab = "Prin Component 1", ylab = "Right sing vector 1")
    abline(c(0,1))

SVD and PCA is essentially the same thing.

SVD and PCA can't be run if values are missing. You can use the impute package to impute the missing data points. 

    library(impute)

