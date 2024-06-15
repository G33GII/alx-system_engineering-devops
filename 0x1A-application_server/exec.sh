#!/bin/bash
# This script sets up the environment and configures the server

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get install -y python3-pip
pip3 install flask
pip3 install sqlalchemy
sudo apt install -y net-tools
sudo apt install -y gunicorn
sudo apt install -y tmux

# Remove any previous versions of the repository and clone the new ones
rm -rf AirBnB_clone_v*
git clone https://github.com/G33GII/AirBnB_clone_v2.git
git clone https://github.com/G33GII/AirBnB_clone_v3.git
git clone https://github.com/G33GII/AirBnB_clone_v4.git


NGINX_CONFIG="/etc/nginx/sites-enabled/default"

sudo tee "$NGINX_CONFIG" > /dev/null <<EOF

server {
    listen 80 default_server;

    listen [::]:80 default_server;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    add_header X-Served-By \$hostname;

    location /hbnb_static/ {
        alias /data/web_static/current/;
    }

    location /static/ {
        alias /home/ubuntu/AirBnB_clone_v4/web_dynamic/static/;
        try_files \$uri \$uri/ =404;
    }




    location ~ ^/airbnb-dynamic/number_odd_or_even/([0-9]+)$ {
        proxy_pass http://0.0.0.0:5001/number_odd_or_even/\$1;
    }

    location /airbnb-onepage {
        proxy_pass http://0.0.0.0:5000/airbnb-onepage;
    }
    location /api/ {
        proxy_pass http://0.0.0.0:5002;
    }
    location / {
        proxy_pass http://0.0.0.0:5003;
    }

    if (\$request_filename ~ redirect_me){
        rewrite ^ https://th3-gr00t.tk/ permanent;
    }

    error_page 404 /error_404.html;
    location = /error_404.html {
        internal;
    }
}
EOF

sudo nginx -t
sudo sytemctl restart nginx

# Start the Flask applications using gunicorn in tmux sessions
cd /home/ubuntu/AirBnB_clone_v3
tmux new-session -d 'gunicorn --bind 0.0.0.0:5002 api.v1.app:app'

cd /home/ubuntu/AirBnB_clone_v4
tmux new-session -d 'gunicorn --bind 0.0.0.0:5003 web_dynamic.app:app'

cd /home/ubuntu/AirBnB_clone_v2
tmux new-session -d 'gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app'
