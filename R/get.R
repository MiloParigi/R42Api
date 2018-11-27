################################################################################
#               Interaction with the API and return a response                 #
################################################################################

api42Get <- function(endpoint, token, params = list(), ret = c("data", "resp")) {
    # Check if the return argument is one of "data" or "resp"
    ret <- match.arg(ret)
    # Build the url from the endpoint and base adress of the API
    url <- build42Url(endpoint)
    parameters <- buildParams(params)
    # Launch the request
    resp <- GET(url, query = parameters, config = config(token = token))
    # Check if there is an error
    stop_for_status(resp)
    # Return the either the response or the data
    if (ret == "data")
        return(content(resp))
    return(resp)
}