#' Aggregate data from Pendo
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
aggregation_json <- function(auth_key) {
  url <- paste0(c("app.pendo.io/api/v1/aggregation"), collapse='')
  report <- httr::POST(url,
                       httr::add_headers(
                         "X-Pendo-Integration-Key" = auth_key,
                         "Content-Type" = "application/json"
                       )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  return(report)
}
