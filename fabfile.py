from fabric.api import env, local, task
import otto.git as git
import otto.web as web

env['otto.git.remote_repo_path'] = '/home/vince/Repo'
env['otto.web.build_dir'] = './build/staged'
env['otto.web.site'] = 'www.control-escape.com'

@task
def B():
    """Set remote host to boadicea.octoped.net"""
    env.hosts.append('boadicea.octoped.net')

@task
def build():
    """Build the site"""
    target = env['otto.web.build_dir']
    local('rm -rf build/*') # make clean
    local('sphinx-build -n -d build/doctrees -b html source %s/htdocs' % target)
    local('cp -a etc %s/' % target)

