<VirtualHost *:80>
ServerName control-escape.com
Redirect permanent / http://www.control-escape.com/
</VirtualHost>

<VirtualHost *:80>
ServerName www.control-escape.com
DocumentRoot /home/vince/PRODUCTION/control-escape/htdocs

# Conditional ENV for SSI magics
BrowserMatchNoCase MSIE MSIE
BrowserMatchNoCase Windows WINDOWS

AddHandler server-parsed .htm .html

Alias /web/configuring-apache2-debian.html linux-guide...
</VirtualHost>
