#' Retrieve specific report from Pendo in JSON format
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_report(some_auth_key, some_report_id)

get_report <- function(auth_key, report_id) {
  url <- paste0(c("http://app.pendo.io/api/v1/report/",report_id,"/results.json"), collapse='')
  report <- httr::GET(url,
                      httr::add_headers(
                        "X-Pendo-Integration-Key" = auth_key,
                        "Content-Type" = "application/json"
                      )
  ) %>%
    httr::content(as="text") %>%
    fromJSON()
  #fromJSON(readline(), flatten = TRUE)

  return(report)
}
