FROM --platform=$BUILDPLATFORM nginx:alpine

#Copy the web application files to nginx html directory
COPY --exclude=Dockerfile --exclude=.git . /usr/share/nginx/html/

#Expose Nginx Port
EXPOSE 80

#Start NginxService (nginx:alpine already has its own entrypoint)
CMD ["nginx", "-g", "daemon off;"]