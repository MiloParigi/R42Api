################################################################################
#                       Interaction with the user endpoint                     #
################################################################################

get42UserIds <- function(logins, token) {
    # Launch the request
    results <- api42Get("users",
                        token,
                        params = list(filter = list(field = "login",
                                                    values = logins)))
    
    # Coerce it to data.table
    data <- as.data.table(t(as.data.table(results)))
    setnames(data, names(data), c("id", "login", "url"))
    data[]
}