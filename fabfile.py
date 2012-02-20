from fabric.api import env, lcd, local, task
import os.path
import otto.git as git
import otto.web as web

env['otto.git.remote_repo_path'] = '/home/vince/Repo'
env['otto.web.build_dir'] = './build/staged'
env['otto.web.site'] = 'www.control-escape.com'

def _project_dir():
    """Helper to return the project directory"""
    return os.path.dirname(os.path.realpath(env['real_fabfile']))

@task
def B():
    """Set remote host to boadicea.octoped.net"""
    env.hosts.append('boadicea.octoped.net')

@task
def build():
    """Build the site"""
    target = env['otto.web.build_dir']
    with lcd(_project_dir()):
        local('rm -rf build/*') # make clean
        local('sphinx-build -n -d build/doctrees -b html source %s/htdocs' % target)
        local('mv %s/htdocs/_static/favicon.ico %s/htdocs/favicon.ico' % (target,target))
        local('cp -a etc %s/' % target)

@task
def clean():
    """Clean up stale build files and tarballs"""
    with lcd(_project_dir()):
        local('rm -rf build/*') # make clean
        local('rm -f *.tar.gz') # make clean
