Version 1.0.1
-------------

## Unit Testing

  - Unit testing was added in order to have TravisCI checking before any branch merge

## Improvements

  - Added **cache** option to the authentication functions
  - More readable errors.
  - In `create42TokenfromJSON()`, the *credentials* variable can now be either the path to a JSON file OR a valid JSON string
  
## Breaking changes

  - Too much information in the JSON file is now a warning (was an error before)

Version 1.0.0
-------------

## Features
  
  - Functions to connect to the 42 API easily
