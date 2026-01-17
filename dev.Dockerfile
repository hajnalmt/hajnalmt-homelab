FROM ghcr.io/gohugoio/hugo:v0.152.2 AS builder
WORKDIR /src

# Copy site files
COPY . .

# Build the site (production mode)
CMD ["server", "--bind", "0.0.0.0", "--baseURL", "http://localhost:1313", "-D"]
