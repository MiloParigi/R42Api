% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create42Token.R
\name{create42Token}
\alias{create42Token}
\title{Create an Oauth2.0 token for 42 API}
\usage{
create42Token(uid, secret, redirect_uri, cache = TRUE)
}
\arguments{
\item{uid}{String - Your application UID}

\item{secret}{String - Your application secret}

\item{redirect_uri}{String - Your application redirect uri}

\item{cache}{A logical value or a string. \code{TRUE} means to cache
using the default cache file \code{.httr-oauth}, \code{FALSE} means
don't cache, and \code{NA} means to guess using some sensible heuristics.
A string mean use the specified path as the cache file.}
}
\value{
A Token2.0 reference class (RC) object, specific to 42.
}
\description{
All those elements can be found in your application page, at
https://profile.intra.42.fr/oauth/applications/\strong{application_id}
}
