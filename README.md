# docker-compose-traefik

A basic example of a reverse proxy using Docker Compose and [Traefik](https://traefik.io/traefik/).

## Quick concepts

Under normal circumstances in local development, I might serve a Laravel application and a Vue application on `localhost` but under two different ports. For example, `:8081` and `:8082`. This usually isn't a big deal, but it can sometimes cause conflicts as most browsers consider *different ports equal to separate top-level domain names*. Meaning things like cross-site cookies and some authentication methods might not work as intended.

What Traefik does is act as a reverse proxy. It maps all port `:80` traffic on the machine running it, to itself. From there, you configure specific domain names or paths to attach to the services in your Docker setup. Traefik determines what service to forward a request to depending on the value of the URL being used, and sends it to the appropriate container accordingly!

## Getting started

Clone this repo, and ensure that the dependencies are installed. From the command line at the project root:

```
cd backend && composer install
cd frontend && npm install
```

Then, bring everything up with Docker Compose:

```
docker-compose up -d
```

Using the values provided by default, two sites should now be available for you in the browser.

- [app.localhost](http://app.localhost): The JavaScript (Vue) app
- [app.localhost/api](http://app.localhost/api): The PHP (Laravel) app

## Making changes

If you'd like to change those domains, take a look at the **labels** attribute values in the `docker-compose.yml` file. Specifically, the value for `Host()` and `PathPrefix()`.

## Problem?

Having a problem getting this set up? Feel free to [open an issue](https://github.com/aschmelyun/docker-compose-traefik/issues/new), or reach out to me on [Twitter](https://twitter.com/aschmelyun)!