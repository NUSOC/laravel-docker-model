# laravel-docker-model
A Model for running laravel on docker. Currently with Træfik. Soon with Swarm. 

# How to set up
## Clone 
Clone this repo and optionally replace the `/project` folder with your Laravel project

## Set up environment files (Docker and Laravel)
Congiure environment file `./.env` for docker. Fill in the missing pieces (and besure to mirror these in the Laravel environment (`./project/.env`) as well. 
```
URL=your.domain.here
DB_ROOT_PASSWORD=
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=
DB_CONNECTION=mysql
DB_HOST=db
```

## Start docker
`docker-compose up -d`

# Benefits
- Includes composer
- On `up`, it runs `composer up` and `php artisan migrate` 
