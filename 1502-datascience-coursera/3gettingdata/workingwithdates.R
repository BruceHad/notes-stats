Working with Dates

    d1 <- date()
    d1
    [1] "Sat Mar 28 15:25:23 2015"
    class(d1)
    [1] "character"
    d2 <- Sys.Date()
    d2
    [1] "2015-03-28"
    class(d2)
    [1] "Date"

    format(d2, "%a %b %d")
    [1] "Sat Mar 28"

    x = c("1jan1960", "2feb1920")
    z = as.Date(x, "%d%b%Y")
    z
    [1] "1960-01-01" "1920-02-02"
    z[1] - z[2]
    > Time difference of 14578 days

The lubridate library is helpful for working with dates.

    library(lubridate)
    ymd("20140108")
    [1] "2014-01-08 UTC"

