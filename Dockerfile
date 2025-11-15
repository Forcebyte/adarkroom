FROM nginx:alpine

# Copy the web application files to nginx html directory
COPY . /usr/share/nginx/html/

# Remove any unnecessary files
RUN rm -f /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/.dockerignore \
    /usr/share/nginx/html/.github

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
