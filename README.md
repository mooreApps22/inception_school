*This project has been created as part of the 42 curriculum by smoore.*

**Inception - Project Overview** 

**Inception** is a Docker deployment of a **LEMP stack** used to host a WordPress website.
This stack runs on Linux uses the service programs **NGINX**, **MariaDB**, and **PHP-FPM/WordPress**.

Managing even just a few services on a host system can quickly become challenging to reproduce and maintain. Docker helps by packaging services into containers, which are isolated processes that port easily to different systems. **Docker Compose** allows you to controller this container network using a single `docker-compose.yml` file. 

**Instructions:**

I have endeavored to make the use of Inception as easy as possible though use of the Makefile found in the root folder next to the srcs/ directory where all of the important configuration files are.

The makefile has many commands, but there are even more commands to be found in the Docker Compose Docs. `make` will start the project up, after a few seconds you can visit [smoore.42.fr](https://smoore.42.fr) and play around with the minimal wordpress website. visit[smoore.42.fr/wp-admin](https://smoore.42.fr/wp-admin.php) to change the website setting or apply new theme.

Useful Makefile rules:
- `make down` takes down site so it is no longer reachable
- `make logs` prints information from each of the specific containers
- `make ps` prints  which service were sucessfully started up
- `make logs_<service>` will generate the log for a specific service only
- `make go_into_<service>` will allow you to executes command inside a specific container
- `ls_volumes` prints the current atributes of volumes

**Virtual Machines vs Docker|Docker Network vs Host Network**

Docker is not a virtual machine, like VirtualBox. Docker doesn't emulate hardware or run its own kernel. Instead, containers containers run as isolated process on the host Linux kernel using namespaces and cgroups.

For this project, Docker is run inside a VirtualBox VM, as required by Inception. **42 London** provides the host machine, which is Ubuntu. This host, comes installed with VirtualBox, which can virtualize the Linux distro Debian. Docker is installed on Debian, and each container runs a Alpine Linux base image.

The Docker Compose file defines how the Inception containers relate to each other. Each container has its own **Dockerfile** which describes the automated step to build it.

**Secrets vs Environment Variables**

Non-sensitive configuration values are stored in a `.env` file. Sensitive information like passwords are handled using `secrets/*.txt`. Both are described in `docker-compose.yml` to be used at runtime. Secrets are not exposed in logs or inspection output, making them more secure than environment variables.

**AI**

Large Language Models (LLMs), such as ChatGPT, were used as a supplementary tool to assist with understanding concepts, locating relevant documentation, and diagnosing specific issues. AI output was verified through official documentation or direct testing.

**Docker Volumes vs Bind Mounts**

Containers do not persist data by default. Docker provides two mechanisms for storing data outside the container lifecycle:
- **Docker Volumes** are managed entirely by Docker. Docker decides where to the data is stored on the host, and users typically interact with the data throught he application itself. Volumes are perfect for persistent applications data such as databases and WordPress content. 
- **Bind Mounts** map a specific directory from the host filesystem into a container. The allows deirect file editing from the host. This is great when developers are active making changes to source code and want to see the changes.

**PID**

In a Docker container, the first process started is the init process from the container's POV. The container's lifetime is tied to this PID 1 process. It may spawn child processes and it can be terminated at any moment. If PID 1 exits, the container comes to a stop.



*Helpful Resources:*
For info on Docker please visit: [Official Docker Documenation](https://docs.docker.com/)
For info on MariaDB please visit: [Official MariaDB Documenation](https://mariadb.com/docs)
For info on WordPress please visit: [Official WordPress Documenation](https://wordpress.org/documentation/)
For info on PHP-FPM please visit: [Official PHP-FPM Documenation](https://www.php.net/manual/en/install.fpm.php)
For info on NGINX please visit: [Official NGINX Documenation](https://nginx.org/en/docs/)
For info on Bash Scripting please watch: [Shell Scripting Full Course](https://www.youtube.com/watch?v=fAgz66M4aNc)
