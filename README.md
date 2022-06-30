# Finology

This README contains installation and API guid

Installation:

The easiest way to set this up would be to run:

```
$ docker-compose build
$ docker-compose up
```

Since this repo has a built in docker setup

For local setup you need to have your postgres running and go

```
$ bundle install
$ rake db:create db:migrate
```

And to run the server

```
$ bundle exec rails s -b 0.0.0.0
```

### specs
There are a couple specs written for checking if the models work as expected

To run them:
```
$ bin/rails test
```

# API documentation

The car model contains:

"car_type": `string` "electric"|"two_wheel"|"sport" [required]

"car_model": `string`

"car_variant": `string`

"car_year": `integer`

## GET /api/v1/cars

```
curl --location --request GET 'http://localhost:3000/api/v1/cars' \
--header 'Content-Type: application/json' \
```

## GET /api/v1/cars?type={car_type}

```
curl --location --request GET 'http://localhost:3000/api/v1/cars?type=two_wheel' \
--header 'Content-Type: application/json'
```

## POST /api/v1/cars

```
curl --location --request POST 'http://localhost:3000/api/v1/cars' \
--header 'Content-Type: application/json' \
--data-raw '{
    "car_type": "electric",
    "car_model": "Tesla",
    "car_variant": "S",
    "car_year": 2019
}'
```
