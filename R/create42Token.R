################################################################################
#                            Create 42 specifc token                           #
################################################################################

#' Create an Oauth2.0 token for 42 API
#'
#' All those elements can be found in your application page, at
#' https://profile.intra.42.fr/oauth/applications/{application_id}
#'
#' This is using an interactive
#'
#' @param uid String - Your application UID
#' @param secret String - Your application secret
#' @param redirect_uri String - Your application redirect uri
#'
#' @return A Token2.0 reference class (RC) object, specific to 42.
#' @import httr
#' @export
create42Token <- function(uid,
                          secret,
                          redirect_uri) {

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
    use_oob = TRUE,
    cache = TRUE
  )

  return(token_42)
}

#' Create an Oauth2.0 token for 42 API using a credential files
#'
#' See \link[R42Api]{create42Token} to know what variables are needed.
#'
#' @param credentials String - path to your credentials JSON file
#'
#' @return A Token2.0 reference class (RC) object, specific to 42.
#' @import jsonlite
#' @export
create42TokenfromJSON <- function(credentials) {
  cred <- fromJSON(credentials)

  create42Token(cred$uid, cred$secret, cred$redirect_uri)
}
