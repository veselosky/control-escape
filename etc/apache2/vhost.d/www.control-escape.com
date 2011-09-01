#=====================================================================
# Redirect alias domains to the main domain
#=====================================================================
<VirtualHost *:80>
ServerName control-escape.com
Redirect permanent / http://www.control-escape.com/
</VirtualHost>

#=====================================================================
# Domain for staging server, for testing before it goes live.
#=====================================================================
<VirtualHost *:80>
ServerName stage.control-escape.com
DocumentRoot /usr/local/share/apache2/sites/www.control-escape.com/staged/htdocs
# Conditional ENV for SSI magics
BrowserMatchNoCase MSIE MSIE
BrowserMatchNoCase Windows WINDOWS
AddHandler server-parsed .htm .html
</VirtualHost>

#=====================================================================
# MAIN DOMAIN
#=====================================================================
<VirtualHost *:80>
ServerName www.control-escape.com
DocumentRoot /usr/local/share/apache2/sites/www.control-escape.com/current/htdocs

# Conditional ENV for SSI magics
BrowserMatchNoCase MSIE MSIE
BrowserMatchNoCase Windows WINDOWS

AddHandler server-parsed .htm .html

# Support old urls for some stuff that has moved around.
Redirect permanent /linux/license.html http://www.control-escape.com/license.html
Redirect permanent /linux/winuser.html http://www.control-escape.com/linux/contents.html
Redirect permanent /shop/ http://www.control-escape.com/books/
Redirect permanent /winuser.html http://www.control-escape.com/linux/contents.html

# New urls for the new Linux Guide paradigm replace old ones
Redirect permanent /contents.html http://www.control-escape.com/linux/contents.html
Redirect permanent /lilo-cfg.html http://www.control-escape.com/linux/lilo-cfg.html
Redirect permanent /lx-cert.html http://www.control-escape.com/linux/lx-cert.html
Redirect permanent /lx-filesys.html http://www.control-escape.com/linux/lx-filesys.html
Redirect permanent /lx-install.html http://www.control-escape.com/linux/lx-install.html
Redirect permanent /lx-mounting.html http://www.control-escape.com/linux/lx-mounting.html
Redirect permanent /lx-partition.html http://www.control-escape.com/linux/lx-partition.html
Redirect permanent /lx-samba.html http://www.control-escape.com/linux/lx-samba.html
Redirect permanent /lx-swinstall.html http://www.control-escape.com/linux/lx-swinstall.html
Redirect permanent /lx-x.html http://www.control-escape.com/linux/lx-x.html
Redirect permanent /x.html http://www.control-escape.com/linux/x.html

# Changed with Sphinx conversion, 2011
Redirect permanent /lx-reading.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /linux/lx-reading.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /lx-basics.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /linux/lx-basics.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /topic-idx.html http://www.control-escape.com/linux/contents.html
Redirect permanent /browse.html http://www.control-escape.com/linux/contents.html
Redirect permanent /xemacs.html http://www.control-escape.com/linux/editing-emacs.html
Redirect permanent /linux/xemacs.html http://www.control-escape.com/linux/editing-emacs.html
Redirect permanent /lx-postinstall.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /linux/lx-postinstall.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /lx-translate.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /linux/lx-translate.html http://www.control-escape.com/linux/bootstrap.html
Redirect permanent /lx-dualboot.html http://www.control-escape.com/linux/lx-whatislinux.html
Redirect permanent /lx-before.html http://www.control-escape.com/linux/lx-whatislinux.html
Redirect permanent /linux/lx-before.html http://www.control-escape.com/linux/lx-whatislinux.html
Redirect permanent /lx-obtain.html http://www.control-escape.com/linux/lx-whatislinux.html
Redirect permanent /linux/lx-obtain.html http://www.control-escape.com/linux/lx-whatislinux.html
Redirect permanent /lx-hwcompat.html http://www.control-escape.com/linux/lx-install.html
Redirect permanent /linux/lx-hwcompat.html http://www.control-escape.com/linux/lx-install.html
Redirect permanent /lx-makeroom.html http://www.control-escape.com/linux/lx-partition.html
Redirect permanent /linux/lx-makeroom.html http://www.control-escape.com/linux/lx-partition.html
Redirect permanent /lx-shell.html http://www.control-escape.com/linux/cli-basics.html
Redirect permanent /linux/lx-shell.html http://www.control-escape.com/linux/cli-basics.html

# FIXME For new Sphinx version
# Redirect permanent /lx-internet.html http://www.control-escape.com/linux/lx-internet.html

</VirtualHost>
