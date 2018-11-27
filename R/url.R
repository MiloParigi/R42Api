################################################################################
#                                 URL Building                                 #
################################################################################

# Build parameters #############################################################

buildParam <- function(name, values, field = NULL) {
    # Check arguments
    if (length(name) != 1)
        stop("'name' argument should be of length one")
    if(!is.null(field) & length(field) != 1)
        stop("'field' argument should be either NULL or of length one")
    if(!length(values))
        stop("'values' argument should be at least of length one")
    
    # If field is not NULL, add brackets around it
    if (!is.null(field))
        field <- paste0("[", field, "]")
    # Coerce values to a list of strings
    values <- paste(values, collapse = ",")
    
    # Build the parameter string
    paste0("&", name, field, "=", values)
}

buildParams <- function(params) {
    # First, check if param is a list
    if (!is.list(params))
        stop("'params' should be a list of parameters")
    # Take every parent name
    names <- names(params)
    # Then, check each elements of params
    ind_params <- lapply(names, function(name, params) {
        # Get the element
        elem <- params[[name]]
        # Check for other parameters than expected
        addit_param <- names(elem)[!names(elem) %in% c("values", "field")]
        if (length(addit_param))
            warning("There is additional parameters not taken into account for your ",
                    name, " parameter:", paste(addit_param, collpase = ", "))
        # Get the parameters I need
        values <- elem$values
        field <- elem$field
        # return the builded parameter
        return(buildParam(name, values, field))
    }, params)
    
    # Return individual parameters as one string
    paste0(ind_params, collapse = "")
}

# Build the basic URL ##########################################################

build42Url <- function(endpoint) {
    # Remove leading and trailing (back)slashes and build the final url
    paste0("https://api.intra.42.fr/v2/", gsub("^[\\\\/]*|[\\\\/]*$", "", endpoint))
}