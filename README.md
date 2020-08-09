Docker image for [Hail](https://hail.is/)

Build image with latest version of Hail.

```
docker build -t hail .
```

Or with a specific version.

```
docker build -t hail:0.2.54 --build-arg HAIL_VERSION=0.2.54 .
```

Running the image starts an IPython REPL with Hail imported as `hl`.

```
docker run --rm -ti -v "$(pwd):/home/hail/workspace" hail
```
