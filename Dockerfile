FROM nginx:stable-alpine

# Copy the web application files to nginx html directory
COPY . /usr/share/nginx/html/

# Copy custom entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Verify the entrypoint script exists and is executable
RUN ls -l /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Use the custom entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
