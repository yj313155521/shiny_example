kolada_api_2 <- function(path) {
  url <- paste0("https://api.kolada.se/v2/municipality?title=",path)

  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  data_1 <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)
  paste("INFORMATION\n","The ID of the city is",data_1[[2]][[1]][[1]],"\n","The type of the region is",data_1[[2]][[1]][[3]],sep = " ")

}






