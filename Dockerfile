FROM ghcr.io/gohugoio/hugo:v0.152.2 AS builder
WORKDIR /src

# Copy site files
COPY . .

# Build the site (production mode)
RUN hugo --minify

# Stage 2: Serve with Nginx
FROM nginx:1.29.3-alpine AS production
COPY --from=builder /src/public /usr/share/nginx/html

# Expose port
EXPOSE 80

# Default command
CMD ["nginx", "-g", "daemon off;"]
