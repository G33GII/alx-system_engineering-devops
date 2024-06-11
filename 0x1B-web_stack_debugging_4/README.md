# 0x1B. Web Stack Debugging #4

## Introduction
This project focuses on troubleshooting and fixing issues in a web stack. The primary goal is to understand and resolve common problems that can occur in web servers, applications, databases, and other components of a web stack.

## Objectives
- Identify and diagnose issues in a web stack.
- Apply debugging techniques to resolve web stack problems.
- Enhance skills in managing and maintaining a web stack.

## Requirements
### General
- All your files will be interpreted on Ubuntu 14.04 LTS.
- All your files should end with a new line.
- A `README.md` file at the root of the folder of the project is mandatory.
- Your Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors.
- Your Puppet manifests must run without error.
- Your Puppet manifests' first line must be a comment explaining what the Puppet manifest is about.
- Your Puppet manifests files must end with the extension `.pp`.
- Files will be checked with Puppet v3.4.

### Install Puppet-Lint
```bash
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```

## Tasks

### Task 0: Sky is the limit, let's bring that limit higher
- **Objective:** In this web stack debugging task, we are testing how well our web server setup featuring Nginx is doing under pressure and it turns out it’s not doing well: we are getting a huge amount of failed requests.
- **Tool:** ApacheBench (ab) is used for benchmarking. 
- **Steps:**
  1. Benchmark with ApacheBench to simulate 2000 HTTP requests to the server with 100 requests at a time.
  2. Identify issues causing failed requests.
  3. Fix the issues to achieve 0 failed requests.

#### Example Benchmark
```bash
root@0a62aa706eb3:/# ab -c 100 -n 2000 localhost/
# Initial results showing 943 failed requests
root@0a62aa706eb3:/# puppet apply 0-the_sky_is_the_limit_not.pp
# Apply Puppet manifest to fix the issue
root@0a62aa706eb3:/# ab -c 100 -n 2000 localhost/
# Final results showing 0 failed requests
```

### Task 1: User limit
- **Objective:** Change the OS configuration so that it is possible to login with the holberton user and open a file without any error message.
- **Steps:**
  1. Fix the "Too many open files" error for the `holberton` user.
  2. Apply Puppet manifest to resolve the issue.

#### Example Fix
```bash
root@079b7269ec1b:~# su - holberton
-su: /etc/profile: Too many open files
-su: /home/holberton/.bash_profile: Too many open files
root@079b7269ec1b:~# puppet apply 1-user_limit.pp
# Apply Puppet manifest to fix the issue
root@079b7269ec1b:~# su - holberton
# No errors after applying the fix
```
## Conclusion
Web stack debugging is a crucial skill for maintaining a robust and reliable web infrastructure. This project provides hands-on experience in identifying and fixing common issues in web servers, applications, databases, and networks. Through these tasks, you will enhance your ability to troubleshoot and ensure the smooth operation of a web stack.
