FROM golang:1.22-bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends gcc libc6-dev git && rm -rf /var/lib/apt/lists/*

ARG MCAP_VERSION=v0.0.62

RUN git clone --depth 1 --branch "releases/mcap-cli/${MCAP_VERSION}" \
      https://github.com/foxglove/mcap.git /src

WORKDIR /src/go/cli/mcap

RUN CGO_ENABLED=1 go build \
      -tags "sqlite_omit_load_extension" \
      -ldflags "-s -w -X github.com/foxglove/mcap/go/cli/mcap/cmd.Version=${MCAP_VERSION}" \
      -o /mcap .

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /mcap /usr/local/bin/mcap

ENTRYPOINT ["mcap"]
