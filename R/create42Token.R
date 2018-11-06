################################################################################
#                            Create 42 specifc token                           #
################################################################################

#' Create an Oauth2.0 token for 42 API
#'
#' All those elements can be found in your application page, at
#' https://profile.intra.42.fr/oauth/applications/\strong{application_id}
#'
#' @inheritParams httr::oauth2.0_token
#' @param uid String - Your application UID
#' @param secret String - Your application secret
#' @param redirect_uri String - Your application redirect uri
#'
#' @return A Token2.0 reference class (RC) object, specific to 42.
#' @import httr
#' @export
create42Token <- function(uid,
                          secret,
                          redirect_uri,
													cache = TRUE) {

  # Force variable type
  uid <- as.character(uid)
  secret <- as.character(secret)
  redirect_uri <- as.character(redirect_uri)

  # Create the 42 token endpoint
  endpoint_42 <- oauth_endpoint(base_url = "https://api.intra.42.fr/oauth",
                                authorize = "authorize",
                                access = "token")

  # Create the 42 app
  app_42 <- oauth_app("42",
                      key = uid,
                      secret = secret,
                      redirect_uri = redirect_uri)

  # Create the token
  token_42 <- oauth2.0_token(
    endpoint = endpoint_42,
    app = app_42,
    client_credentials = TRUE
  	)

  return(token_42)
}

#' Create an Oauth2.0 token for 42 API using a credential files
#'
#' See \link[R42Api]{create42Token} to know what variables are needed.
#'
#' @param credentials String - path to your credentials JSON file or valid JSON
#' string
#'
#' @return A Token2.0 reference class (RC) object, specific to 42.
#' @import jsonlite
#' @export
create42TokenfromJSON <- function(credentials) {

  # List of supported params in the file
  sup <- c("uid", "secret", "redirect_uri")

  # Force variable type
  credentials <- as.character(credentials)

  # Check if file exists
  if (!file.exists(credentials) & !jsonlite::validate(credentials))
    stop("credentials parameter is neither a file nor a valid JSON string")

  # Read the JSON file or keep the string if credentials is not a file
  cred <- fromJSON(credentials)

  # Check that we don't have extra parameters
  if(!all(names(cred) %in% sup)) {
    warnings("The following extra parameter(s) are in the credentials file:\n",
         paste(names(cred)[names(cred) %in% sup], sep = ", "))
  }

  # Check that we have all parameters
  if(!all(sup %in% names(cred))) {
    stop("The credentials file is missing the following parameter(s):\n",
         paste(sup[sup %in% names(cred)], sep = ", "))
  }

  # Get the token
  create42Token(cred$uid, cred$secret, cred$redirect_uri)
}
