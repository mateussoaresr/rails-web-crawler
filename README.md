# Rails Web Crawler

API to return phrase searches on the site http://quotes.toscrape.com/
and simulate a cache by saving responses to the database and using them
in the next searches.

Ruby version:
- 2.66p146

## Specifications

### User

- A user can be created by sending a :post request to "/users"
- A user can log in by sending a :post request to "/auth/login"
- Upon logging in, the jwt token will be returned,
which should be sent in the header in next requests

### Quote

- A quote can be searched by sending a get request to "/quotes/{tag}"
and so the quotes will be returned by tag.
- The quote's model has_and_belongs_to_many tags
- The quote's model belongs_to author

### Tag

- The tag does not have its own route, it only serves to filter quotes
- The tag's model has_and_belongs_to_many quotes

### Author

- The author does not have its own route
- The author's model has_many quotes

## Extra

### Run application

- Just use the ``` rails server ``` and send requests to the endpoints listed above.

### Database

- The application uses the mongoid gem, for connection to the mongoDB database
- The default settings are in "app/config/mongoid.yml"

### Basic specs

- Validation and association tests for models quotes and tags
- Basically run in your command line: ```rspec spec/```
