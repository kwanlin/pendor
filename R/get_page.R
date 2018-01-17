#' Retrieve list of pages from Pendo
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_pages_list(some_auth_key)

get_pages_list <- function(auth_key) {
  url <- paste0(c("https://app.pendo.io/api/v1/page"), collapse='')
  pages_list <- httr::GET(url,
                      httr::add_headers(
                        "X-Pendo-Integration-Key" = auth_key,
                        "Content-Type" = "application/json"
                      )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  #fromJSON(readline(), flatten = TRUE)

  return(pages_list)
}
