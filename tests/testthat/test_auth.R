context("Authentication token")

################################################################################
#                                   Errors                                     #
################################################################################

test_that("We are running non-interactively", {
	expect_equal(interactive(), FALSE)
})

test_that("Authentication is failing without parameters", {
	expect_error(create42Token())
	expect_error(create42TokenfromJSON())
})

# Get the name of a file that is not existing
while(file.exists((file_not_existing <- paste0((sample(c(letters), 10)),
																							 collapse = ""))))

# File not existing
test_that("Authentication is failing i the file does not exists", {
	expect_error(create42TokenfromJSON(ffile_not_existing))
})

# Missing JSON params
test_that("Authentication is failing if there is missing parameters", {
	expect_error(create42TokenfromJSON(toJSON(list(uid = 1, secret = 2),
																						auto_unbox = TRUE)))
})

################################################################################
#                             Get TravisCI values                              #
################################################################################

uid <- Sys.getenv("R42Api.UID", unset = NA)
secret <- Sys.getenv("R42Api.SECRET", unset = NA)
uri <- Sys.getenv("R42Api.URI", unset = NA)

test_that("Authentication is returning a token object", {
	expect_equal(class(create42Token(uid, secret, uri, cache = FALSE)),
							 c("Token2.0", "Token", "R6"))
})

rm(uid, secret, uri)
gc()