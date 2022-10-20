
kolada_api <- function(path) {
  url <- httr::modify_url("https://api.kolada.se", path = path)

  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)


}

data_1 <- kolada_api("v2/municipality?")
data_1

vector_1 <- c()
i <- 1
for(i in 1:312){
  vector_1[i] <- data_1[[2]][[i]][[1]]
  i <- i + 1
}
vector_1

vector_2 <- c()
i <- 1
for(i in 1:312){
  vector_2[i] <- data_1[[2]][[i]][[2]]
  i <- i + 1
}

vector_3 <- c()
i <- 1
for(i in 1:312){
  vector_3[i] <- data_1[[2]][[i]][[3]]
  i <- i + 1
}

data <- data.frame(vector_1,vector_2,vector_3)

