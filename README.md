# Control-Escape

Control-Escape is an educational site that helps people take control of digital
technology to achieve their goals. This repository contains the software that produces
the site.

My Premise: Django is the best web framework for tiny teams building real products.

## Dependency Management

This project includes [pip-tools](https://pypi.org/project/pip-tools/) for dependency
management. There are two requirements files: `requirements.in` provides the acceptable
ranges of packages to install in a production environment (or any other environment);
`requirements-dev.in` provides packages to install in development environments. Both of
these have corresponding "pin" files: `requirements.txt` and `requirements-dev.txt`.

To add a new dependency, add it to the correct `.in` file, and then run
`manage.py pipsync` to regenerate the pin files and synchronize your current virtual
environment with the new pin files.

Any arguments passed to `manage.py pipsync` will be passed through to the underlying
`pip-compile` command. For example, to bump to the latest Django patch release use
`manage.py pipsync --upgrade-package django`. See the
[pip-tools docs](https://pypi.org/project/pip-tools/) for complete details.

The pin files are not included in the template repository, but will be generated when
you run `manage.py devsetup`. This ensures you will get the latest version of Django and
related packages when starting a new project.
