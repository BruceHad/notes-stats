
# Literate programming with Knitr

The original idea came from Donald Knuth.

The article is a stream of text and code "chunks".

Literate programs are weaved into human readable form, and tangled to produce machine readable document.

Literate programming needs a document language and a programming language. knitr supports a variety.

Pros: data, text and code in one place. Data is updated automatically to reflect external changes. Code is live -- automatic regression test when building a document.

Cons: Having the code in the document can make it difficult to read if there is a lot of code. Can be substantially slower (although there are tools to help. caching?)

knitr is an R package written by Yihui Xie. Built into R Studio. Supports Markdown, latex and html. Can export to PDF or HTML or other formats.

knitr is good for manual, short technical documents and tutorials, reports, data processing summaries. Not so good for very long research articles (single document gets confusing). Documents that use precise formatting.

R Studio will do the work for you. Manually:

    library(knitr)
    setwd()
    knit2html("my_doc.rmd")
    browseURL("my_doc.html")

Code chunks can have names: ```{r firstchunk} ```

if you don't want the code shown you can set echo to false ```{r firstchunk, echo=FALSE}```

You can also hid eh the results with results="hide"

You can also add code variables inline with text.

``` {r compute time}
time <- format(Sys.time(), "%a %b %d %X %Y")
rand <- rnorm(1)
```

The current time is `r time`. Random number: `r rand`.

Similarly you can add in charts.

```{r}
x <- rnorm(100); 
y <- x + rnorm(100, sd = 0.5)
```

Here is a scatterplot of the data.

```{r scatterplot, fig.height=4}
par(mar= c(5,4,1,1), las=1)
plot(x, y, main = "My simulated data")

Knitr produces an html file and creates a base64 encoded image of the plot.

## Global Options

```{r setoptions, echo=FALSE}
opts_chunk$set(echo = FALSE, results="hide")
```

## Caching Results

The cache=TRUE option can be set on a chunk to store results of a computation. After the first run results are loaded from cache.



