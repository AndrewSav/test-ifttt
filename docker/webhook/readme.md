# Webhook with bash and docker

This is a container based on <https://hub.docker.com/r/almir/webhook/> which implements <https://github.com/adnanh/webhook>.
It adds bash and docker to the image.

To build:

```bash
docker build --rm=true --no-cache=true --pull=true -t andrewsav/webhook .
docker push andrewsav/webhook
```

