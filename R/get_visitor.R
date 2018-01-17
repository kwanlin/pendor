#' Retrieve specific visitor from Pendo
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_visitor(some_auth_key, some_report_id)

get_visitor <- function(auth_key, visitor_id) {
  url <- paste0(c("http://app.pendo.io/api/v1/visitor/",visitor_id), collapse='')
  visitor <- httr::GET(url,
                      httr::add_headers(
                        "X-Pendo-Integration-Key" = auth_key,
                        "Content-Type" = "application/json"
                      )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  #fromJSON(readline(), flatten = TRUE)

  return(visitor)
}
