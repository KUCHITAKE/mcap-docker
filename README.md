# mcap-cli-image

Container image for the [MCAP CLI](https://github.com/foxglove/mcap) — a tool for reading, writing, and manipulating [MCAP](https://mcap.dev/) files.

## Pull

```bash
docker pull ghcr.io/kuchitake/mcap-docker:latest
```

## Usage

```bash
# Show file info
docker run --rm -v $(pwd):/data ghcr.io/kuchitake/mcap-docker info /data/recording.mcap

# List channels
docker run --rm -v $(pwd):/data ghcr.io/kuchitake/mcap-docker list channels /data/recording.mcap

# Merge files
docker run --rm -v $(pwd):/data ghcr.io/kuchitake/mcap-docker merge /data/a.mcap /data/b.mcap -o /data/merged.mcap
```

### Shell alias

```bash
alias mcap='docker run --rm -v $(pwd):/data ghcr.io/kuchitake/mcap-docker'
mcap info /data/recording.mcap
```

## Build locally

```bash
docker build -t mcap-cli .

# Specify a different mcap CLI version
docker build --build-arg MCAP_VERSION=v0.0.61 -t mcap-cli .
```

## Image details

| Item | Value |
|------|-------|
| Base image | `debian:bookworm-slim` |
| Platforms | `linux/amd64`, `linux/arm64` |
| Entrypoint | `mcap` |
| Default CLI version | `v0.0.62` |

## License

MIT
