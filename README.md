# docker-ojs
Nginx docker container with configuration for OJS (including SSL via letsencrypt)

## Prerequisites
- Docker

## Installation
Clone into the repository

Update the ojs submodule
```
git submodule update --init --recursive
```

Open `docker-compose.yml` and configure your MySQL user / password.
Open `init-letsencrypt.sh` and configure your domain

`init-letsencrypt.sh` generates dummy certificates for the first boot of your docker container as the nginx won't start without any certificate.

Open `conf/nginx/default.conf` and set the dummy certificate path to your needs (as in replace the domain in the path)

Start the docker container via `docker-compose up -d` from the root directory.

Open `get-letsencrypt-cert.sh` and configure your domain, local path and email address.

`get-letsencrypt-cert.sh` starts a certbot instance which tries to challenge your booted nginx container. If it is successful the "real" certificates will be generated and saved to your disk.

After generation of the certificates you need to edit your `conf/nginx/default.conf` again and replace the dummy certificates with the live certificates. 
For this it is enough to replace the string `dummy` with `live`.

Now restart your docker container from the root directory via `docker-compose down && docker-compose up -d`.

If everything worked correctly your nginx server should have a valid certificate when accessing it.

The OJS installation is added as a submodule in folder ojs.
So you can `cd ojs` and follow the installation instructions found in the [pkp/ojs repository](http://github.com/pkp/ojs)

After finishing the instructions from there you need to change one last thing inside the `docker-compose.yml`.
Replace `- ./html:/usr/share/nginx/html` with `- ./ojs:/usr/share/nginx/html` for the services `ojs` and `ojsphp`

Restart your docker container again from the root directory via `docker-compose down && docker-compose up -d`.
Now you can proceed with the installation of your OJS installation in the browser.

## Contributing

If you want to contribute to this plugin please open a pull request.

## Authors

See the list of [contributors](https://github.com/KRONWALLED1134/docker-ojs/contributors) who participated in this project.
