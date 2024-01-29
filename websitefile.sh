#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html>
        <body>
        <h1>Hello World</h1>
        <img src="https://w0.peakpx.com/wallpaper/697/243/HD-wallpaper-virat-kohli-wali-king-kohli-in-sunglasses-virat-kohli-in-sunglasses-king-kohli-cricketer.jpg" width="400" height="600">
        </body>
        </html>" > /var/www/html/index.html