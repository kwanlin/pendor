#' Retrieve specific account details
#'
#' @param string input character vector
#' @return
#' @seealso
#' @export
#' @examples
#' get_account(some_auth_key, some_account_id)

get_account <- function(auth_key, account_id) {
  url <- paste0(c("https://app.pendo.io/api/v1/account/",account_id), collapse='')
  account <- httr::GET(url,
                       httr::add_headers("X-Pendo-Integration-Key" = auth_key,
                                         "Content-Type" = "application/json")
  ) %>%
    httr::content(as="text") %>%
    fromJSON()

  return(account)
}
