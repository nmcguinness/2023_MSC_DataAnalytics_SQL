#' @title 1_Local_SQLite.R
#' @description Connecting querying and modifying a local SQLite DB file
#' @author NMCG
#' @bugs None
#' @keywords SQL, DBI, query, execute, tabular, local
#' @see https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html
#' @seealso https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html


## Clear console on each execute and set chunk default to not show code

cat('\014')

## Download and load libraries

if(!require("DBI"))
  install.packages("DBI")
if(!require("dplyr"))
  install.packages("dplyr")
if(!require("tidyverse"))
  install.packages("tidyverse")

library(DBI)
library(dplyr)
library(tidyverse)

# Connect (and create) a new local SQLite DB

conn <- dbConnect(RSQLite::SQLite(), "mtcars_db.sqlite")

# Add table data to the SQLite DB

dbWriteTable(conn, "mtcars", mtcars, overwrite = T, append = F)

# Test the DB

# View(mtcars)

dbListTables(conn)
dbListFields(conn, "mtcars")

# Query and store the results

# CRUD - Create, Rename, Update, Delete

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars")
# result

# result <-  dbGetQuery(conn, "SELECT wt, disp, mpg FROM mtcars")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22 ORDER BY hp ASC LIMIT 4")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22 ORDER BY hp ASC LIMIT 4")
# result

# result <-  dbGetQuery(conn, "SELECT COUNT(mpg) FROM mtcars WHERE mpg > 25")
# result
# 
# result <-  dbGetQuery(conn, "SELECT AVG(hp) FROM mtcars")
# result

# Execute a query with no result

result <-  dbGetQuery(conn, "SELECT * FROM mtcars")
knitr::kable(result)

dbExecute(conn, "DELETE FROM mtcars WHERE mpg <= 20")

result <-  dbGetQuery(conn, "SELECT * FROM mtcars")
knitr::kable(result)

# Do NOT forget to disconnect - otherwise we may hit a remote connection limit

dbDisconnect(conn)


