What's this?
============
The Control-escape.com project source.

How To...
============
To build the site:

    make html

or for a full rebuild:

    make clean html

Deployment now uses Ansible.

    ansible-playbook -i <host_inventory> deploy.yml

The Ansible host must declare the following host vars:

* website_root - directory where sites are installed
* website_user - owner of site files
* website_group - group owner of site files
* http_service - apache2 or nginx

For the moment, the only virtual host config provided is for Apache 2.4.

TODO
==================
* Experiment with different ad placements and sizes.
    - Use 160x600 adsense in right rail.
    - Custom Amazon search widget for each page.
* Add Disqus comments
* Add social sharing widget
