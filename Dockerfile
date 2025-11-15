FROM nginx:stable-alpine

# Copy the web application files to nginx html directory
COPY . /usr/share/nginx/html/

# Copy custom entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Remove any unnecessary files
RUN rm -f /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/.dockerignore \
    && rm -rf /usr/share/nginx/html/.github \
    && rm -f /usr/share/nginx/html/docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Use the custom entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
