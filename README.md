# proxylib_docker_base

PHP 8.4 FPM runtime image for ProxyLib and ProxySite. It holds only the base image
and system packages. Application code is mounted into the container at runtime.

```
ghcr.io/rhamdeew/proxylib_docker_base:latest
```

## Builds

GitHub Actions builds `linux/amd64` and `linux/arm64` images:

- on a push to `main` that changes the `Dockerfile` or the workflow
- every Monday at 06:00 UTC, to pick up base image and package updates
- on demand, through `workflow_dispatch`

Pull requests build the image without publishing it.

## Tags

- `latest` is the newest build from `main`.
- `YYYYMMDD-<short sha>` identifies one build. Use it to roll back.
