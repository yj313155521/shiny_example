library(jsonlite)
library(httr)
library(utils)

#' @import jsonlite
#' @import httr
#' @import utils


kolada_api <- function(path) {
  url <- modify_url("https://api.kolada.se", path = path)

  resp <- GET(url)
  if (http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  parsed <- fromJSON(content(resp, "text"), simplifyVector = FALSE)

  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "kolada_api"
  )
}

print.kolada_api <- function(x, ...) {
  cat("<kolada", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}


data_1 <- kolada_api("v2/municipality?")
data_1






