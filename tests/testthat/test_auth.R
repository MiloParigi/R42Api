context("Authentication token")

# Errors #######################################################################

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

# Authentication ###############################################################

cred <- system.file("test_login", "credentials.json", package = "R42Api")
cache <- system.file("test_login", ".httr-oauth", package = "R42Api")

test_that("The credential JSON is present in the package build", {
  expect_equal(file.exists(cred), TRUE)
})

test_that("The .httr-oauth file is present in the package build", {
  expect_equal(file.exists(cache), TRUE)
})

test_that("Authentication is working", {
	expect_equal(class(create42TokenfromJSON(cred, cache = cache)),
							 c("Token2.0", "Token", "R6"))
})