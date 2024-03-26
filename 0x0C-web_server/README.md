# 0x0C Web Server

---

## Overview
0x0C Web Server is a lightweight, scalable, and efficient web server designed to serve static content efficiently and handle dynamic requests with ease. It is built with simplicity, performance, and security in mind, making it suitable for a wide range of applications, from personal projects to production-level deployments.

## Features
- **Static Content Serving:** Serve HTML, CSS, JavaScript, images, and other static content quickly and efficiently.
- **Dynamic Content Handling:** Support for server-side scripting languages such as PHP, Python, and Ruby for generating dynamic content.
- **High Performance:** Utilizes efficient concurrency models and optimizations to handle high traffic loads with minimal resource usage.
- **Security:** Implements security best practices to mitigate common web server vulnerabilities and threats.
- **Configuration Flexibility:** Easily configurable settings for customizing server behavior according to specific requirements.
- **Logging:** Detailed logging capabilities for monitoring server activity and diagnosing issues.
- **Easy Deployment:** Straightforward installation process and minimal dependencies make deployment hassle-free.

## Installation
1. **Download:** Clone or download the 0x0C Web Server repository from GitHub.
2. **Compile:** Compile the server source code using the provided Makefile.
3. **Configuration:** Edit the server configuration file (`config.json`) to customize settings such as port, document root, and supported MIME types.
4. **Run:** Execute the server binary, providing the path to the configuration file as an argument.

## Configuration
- **Port:** Specify the port on which the server will listen for incoming connections.
- **Document Root:** Set the directory from which the server will serve files.
- **Index Files:** Define the filenames to be used as default index files when accessing directories.
- **MIME Types:** Configure mappings between file extensions and corresponding MIME types for accurate content-type detection.
- **Concurrency Model:** Choose between multi-process or multi-threaded concurrency models based on performance and resource requirements.

## Usage
- **Static Content:** Place HTML, CSS, JavaScript, images, and other static files in the document root directory for the server to serve.
- **Dynamic Content:** Utilize server-side scripting languages such as PHP, Python, or Ruby to generate dynamic content. Ensure that the corresponding interpreters are installed and configured properly.
- **Logging:** Access server logs to monitor traffic, diagnose errors, and track server activity.
- **Security:** Implement security best practices such as using HTTPS, input validation, and access controls to safeguard against common web threats.

## Example
```bash
$ ./0x0C_web_server config.json

