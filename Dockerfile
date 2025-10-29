# Step 1: Use Nginx to serve static site
FROM nginx:alpine

# Step 2: Copy project files to nginx html folder
COPY . /usr/share/nginx/html

# Step 3: Expose port 80
EXPOSE 80

# Step 4: Start nginx
CMD ["nginx", "-g", "daemon off;"]

