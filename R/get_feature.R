#' Retrieve specific feature
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_feature(some_auth_key, some_feature_id)



get_feature_list <- function(auth_key) {
  url <- paste0(c("https://app.pendo.io/api/v1/feature"), collapse='')
  feature_list <- httr::GET(url,
                       httr::add_headers("X-Pendo-Integration-Key" = auth_key,
                                         "Content-Type" = "application/json")
  ) %>%
    httr::content(as="text") %>%
    fromJSON()

  return(feature_list)
}


get_feature <- function(auth_key, feature_id) {
  url <- paste0(c("https://app.pendo.io/api/v1/feature?id=",feature_id), collapse='')
  feature <- httr::GET(url,
                       httr::add_headers("X-Pendo-Integration-Key" = auth_key,
                                         "Content-Type" = "application/json")
  ) %>%
    httr::content(as="text") %>%
    fromJSON()

  return(feature)
}
