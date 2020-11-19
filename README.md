# laravel-docker-model
A Model for running laravel on docker. Currently with Træfik. Soon with Swarm. 

# How to set up
## Clone 
Clone this repo and optionally replace the `/project` folder with your Laravel project

## Set up environment files (Docker and Laravel)
Congiure environment file `./.env` for docker. Fill in the missing pieces (and be sure to mirror these in the Laravel environment (`./project/.env`) as well. 
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
- Includes [composer](https://github.com/NUSOC/laravel-docker-model/blob/e0e44f21b11da9b59ae46bb71b25bf48a1f58e3f/Dockerfile#L2)
- On `up`, it runs `composer up` and `php artisan migrate` by [altering](https://github.com/NUSOC/laravel-docker-model/blob/e0e44f21b11da9b59ae46bb71b25bf48a1f58e3f/Dockerfile#L15) the last line of apache2-foreground
- the `./project` folder contains the skeleton of a new Laravel 8 project ready for use

# Notes / Caveats 
- Currently set up to work with Træfik 1.7. We will be moving this whenever our environment goes over to Docker Swarm. 
