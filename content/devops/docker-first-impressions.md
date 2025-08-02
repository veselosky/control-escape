---
title: "Docker First Impressions"
type: article
date: "2024-09-09"
description: A first try at adopting Docker in my development workflow.
keywords:
  - devops
  - docker
---

Docker has been around for many years now, and the ecosystem around "containers" has
matured over that time. Unfortunately for me, I have not had the opportunity to work
with the technology professionally, as my employers over that period have continued to
use Virtual Machines for deployments. Now that I'm getting more serious about my side
projects, though, it's time for me to get into this area of technology. This article
covers my first impressions after about a week of reading up and playing around.

## Docker Containers: Why Bother?

Before adding any technology to your stack, you should always ask why. What problems
does it solve, and does it bring more problems than it eliminates? In a nutshell, here's
what Docker brings to the table.

- Simplified Deployment -- Docker allows you to define an application's required
  services and run the whole suite of services with one command.
- Deployment Isolation -- Containers are isolated from each other, so you can run many
  applications on the same server without worrying about them interfering with each
  other.
- Environment Consistency -- Docker places all the support files for your application
  into a single image, ensuring that you don't run into missing files, permissions
  problems, or wrong versions of a library or operating system.
- Ease of Development Setup -- Setting up a new development environment for a project
  can be a pain. Often it involves installing a database, a cache server, a queue
  broker, and more. All this can be defined in a file such that all you need to do is
  `docker compose up` to start your application and all its backing services locally.
  Nothing else to install.

## Docker Vocabulary

"Docker Engine" is, you can guess, the core "engine" that powers Docker.

"Docker Desktop" is a desktop application that help you manage your Docker resources.

An "image" is kind of like a zip file or ISO image containing the file system with all
the files for your application.

A "container" is kind of like a lightweight virtual machine in which your application's
processes run.

A "volume" is a managed disk space on the host computer that gets mounted in the
container for file persistence between container restarts.

A "bind-mount" is a mapping that exposes specific host files or directories in the
container.

The difference between a volume and a bind-mount is volumes have only names (not paths)
and are managed by Docker somewhere in its files, whereas bind-mounts map a specified
host path (starting with / or ./) to a container path. Generally, if you have some data
on the host you want to expose to the container, use a bind-mount, if you have data
inside the container that needs to be persisted between restarts or accessed from
somewhere else, use a volume.

A `Dockerfile` is a recipe for creating an image, along with some metadata about how to
run it.

A `docker-compose.yaml` file defines an application stack consisting of one or several
containers, including the services, port numbers, volume mappings, etc.

"Docker Hub" is a repository of pre-built Docker images packaging all kinds of software.

## Dockerfiles and Images: It's Complicated

When I first laid eyes on a Dockerfile, I thought, this looks a lot like a configuration
management recipe as used in Chef or Ansible. And it is. But it's more complicated than
that. A naive implementation would just copy your files into the container and call it
done; but this would ignore whole tomes of "best practices" to limit the size of images
and more importantly, to limit the attack surface for security purposes.

The first confusing choice is choosing a base image. Docker images are almost never
built from scratch, but start with an official image containing the basic necessities
and build up from there. Images are pulled from [Docker Hub](https://hub.docker.com) or
some other repository of images. The
[official Python image](https://hub.docker.com/_/python) has a bewildering number of
different editions and versions which are designated by "tags". The tags typically
indicate a version number for Python, and an operating system version it is installed on
within the container image.

Opinions vary on which of these images to use. From what I've gathered, Alpine images
are much smaller than others, but at the expense of leaving out libraries that are
important and sometimes necessary for building Python packages, which can cause problems
if your project has dependencies that use system libraries or compiled modules. The safe
option appears to be to use the latest "slim" version, which gives you a Debian-based
image with a good compromise between size and completeness.

Another complication is that, despite it being the default, it's bad security practice
to run programs as root inside a container. So you end up having to create a user to run
your app and then deal with file permissions issues inside the container (assuming the
container needs to persist data).

In the end, building out a container to run a production application isn't that
different from setting up a VM. It mostly involves installing system packages, creating
users, groups, directories, and files, and defining some metadata.

## Unanswered Questions

There are some questions that do not seem to have a consensus answer in the ecosystem,
specifically when and how to run one-time scripts required for deployment, including
`manage.py migrate` and `manage.py collectstatic`. There doesn't seem to be a "jobs" or
"tasks" key in docker-compose files, so running these either has to happen at container
start up (which can cause issues if starting multiple containers), or as a separate
`docker compose run ...` step before starting the containers.

I don't have enough experience to form an opinion on this yet, so I'll be experimenting
to see how it plays out.

## Resources

Here a few resources I have found helpful.

- [Streamlining Django Development with Docker](https://hackernoon.com/streamlining-your-django-development-environment-with-docker-containers)
  by Zach Todd
- The
  [Cookiecutter Django documentation](https://cookiecutter-django.readthedocs.io/en/latest/developing-locally-docker.html)
  on using Docker.
- The [Cookiecutter Django source](https://github.com/cookiecutter/cookiecutter-django)
  with all its Docker-related files.
- [Production-ready Python Docker Containers with uv](https://hynek.me/articles/docker-uv/)
  by Hynek Schlawack
