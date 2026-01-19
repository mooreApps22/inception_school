*This project has been created as part of the 42 curriculum by smoore.*

**USER DOCUMENTATION**

The name of this project is **Inception**. Inception is a **dockerized LEMP-stack infrastructure** which acts as a web server for a WordPress Blog.

**Linux** is the Operating System, and it is the base for the entire infrastructure. Of course, Inception is build in a Virtual Machine, to a virtual Debian Linux is the base for the project. **Docker** is installed on Debian Linux. Docker is a service program, it runs as a server in the background and waits for commands from either a user or another program. Docker creates a container for each service in the LEMP-stack.

The four services provided in this LEMP-stackare:
1. NGINX
2. MariaDB
3. PHP-FPM
4. WordPress

NGINX is a **reverse proxy server** and is located in the nginx container. NGINX is a robust program with so many available features, but for the purposes of Inception, it securely connects this webserver to a browser, via the localhost. The browser renders webpages for an end-user to interact with. When they click a button, it sends the HTTPS request to NGINX, which then sends it to the specified locations, as directed in the `ngix.conf` file. In Inception, the requests are sent to the wordpress container.

The wordpress container has two service programs. **PHP-FPM** and **WORDPRESS**. PHP-FPM stands for PHP-Fastcgi Process Manager. As the name suggests, it manages the child processes needed to execute the HTTPS requests sent from nginx. WordPress is used to install and mangage the php files which make the actual website. These files are stored in the wordpress volume. PHP also includes an API for interfacing with MariaDB. It establishes a connection to the MariaDB server in the mariadb container.

The mariadb container hosts the MariaDB server. It's tasked with setting up the needed databases for the WordPress website. Any admins or users have to registered in the database, as well as posts or comments.

Step to run Inception:
1. To access the website you need to makes sure that inception is downloaded on your system.
2. To build, start, and run the website go to the directory and run `make`
3. Open the Firefox browser and go to [smoore.42.fr](https://smoore.42.fr)
4. Select Ignore warning, this is fine for because it a self-sign certificate
5. You can now click [Hello, World](https://smoore.42.fr/?p=1)
6. To access the admin page go to [here](https://smoore.42.fr/wp-admin.php)
7. As an admin you can manage setting of the website
8. You can also login as a subscriber [here](https://smoore.42.fr/wp-login.php)
9. As a guess, login, or admin you can post comments on this blog website
10. If you want to stop running the server you can run `make down`
11. If you want to find passwords look in the secrets directory files
12. If you want to check the status of a particular service you can run `make logs_<service>`
