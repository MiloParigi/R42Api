 R42Api
 ======

[![Build Status](https://travis-ci.com/MiloParigi/R42Api.svg?branch=master)](https://travis-ci.com/MiloParigi/R42Api)

Overview
--------
This package gives you different functions to interact with the 42 School API.
At this stage, you have multiple options to create an Oauth2 token for your API requests.

Have a look at the [api documentation](https://api.intra.42.fr) for more infos

Installation
------------

As this package is only useful for a few 42 students, it will surely never make it to CRAN. You'll need to use the [devtools](https://cran.r-project.org/web/packages/devtools/index.html) package to install it from Github.
``` r
# Install the devtools package
install.packages("devtools")
library("devtools")

# Install the development version from GitHub:
devtools::install_github("MiloParigi/R42Api")
library("R42Api")
```

Usage
-----

### Get your credentials
First thing first, you need to create your 42 application (see the [Getting Started](https://api.intra.42.fr/apidoc/guides/getting_started) section of the documentation)

### Authentication
R42Api is connecting interactively, at your first connection you’ll be prompted to authorize R42Api in the browser. Your credentials will be cached across sessions in ``.httr-oauth``.

You want to create an Oauth2.0 token to interact with the API.
For that, you have two possibilities:
- Use a JSON file with the needed credentials fields: *uid*, *secret* and  *redirect_uri*
``` r
token_42 <- create42TokenfromJSON("/path/to/credentials.json")
```
- Directly use your credentials in R
``` r
token_42 <- create42Token(uid = YOUR_UID,
                          secret = YOUR_SECRET,
                          redirect_uri = YOUR_REDIRECT_URI)
```

I highly suggest you use the first method for scripts, because having credentials in your code is **ALWAYS** a bad idea.

### Interact with the api
With this token, you can just use the [httr](https://github.com/r-lib/httr) package to interact with the API, by including the token in the ``config`` of your request:
``` r
# Get infos about yourself
req <- GET("https://api.intra.42.fr/v2/me", config = config(token = token_42))
# Check for an error
stop_for_status(req)
# Give you the content
content(req)
```
