#' Retrieve specific guide Pendo in JSON format
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_guide(some_auth_key, some_guide_id)

get_guide_list <- function(auth_key) {
  url <- paste0(c("http://app.pendo.io/api/v1/guide"), collapse='')
  guide_list <- httr::GET(url,
                      httr::add_headers(
                        "X-Pendo-Integration-Key" = auth_key,
                        "Content-Type" = "application/json"
                      )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  #fromJSON(readline(), flatten = TRUE)

  return(guide_list)
}

get_guide <- function(auth_key, guide_id) {
  url <- paste0(c("http://app.pendo.io/api/v1/guide?=", guide_id), collapse='')
  guide <- httr::GET(url,
                      httr::add_headers(
                        "X-Pendo-Integration-Key" = auth_key,
                        "Content-Type" = "application/json"
                      )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  #fromJSON(readline(), flatten = TRUE)

  return(guide)
}
