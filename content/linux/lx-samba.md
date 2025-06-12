---
type: article
title: "Networking Windows & Linux"
description: "How to integrate Linux computers into a Windows network."
keywords: ["samba", "linux"]
date: "2011-06-04T23:13:56-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

Linux is able to access directories, files, and printers that are shared from MS Windows
machines, and can act as a server for Windows clients, thanks to a software package
called SaMBa. The latest version of SaMBa also allows Linux computers to participate in
Windows NT domain-based networks.

SaMBa is an implementation of the SMB protocol, also called the NetBIOS or LanManager
protocol. This is a networking protocol used by Windows. It ships with most of the major
Linux distributions, and is available for many different operating systems.

Getting SaMBa running was quite easy for me with the help of the
[SMB HOW-TO](http://www.tldp.org/HOWTO/SMB-HOWTO.html), and should be equally easy for
most folks, so I won\'t go into too much detail. The steps are these:

1.  **Get your Ethernet configured.** (A whole separate FAQ!)

2.  **Set up TCP/IP on each of your machines.** By default MS uses their NetBEUI
    protocol, which Linux doesn\'t understand (yet). You need to install the TCP/IP
    protocol for Windows (comes on the Windows CD). This is done under Network
    Properties in the control panel. (See Windows help for details, but I found it self
    explanatory.) Each machine must have an IP address assigned. All the IP\'s must be
    on the same subnet (have the same subnet mask). You should use IP\'s that have been
    reserved for private networks. See the
    [Networking HOW-TO](http://www.tldp.org/HOWTO/Net-HOWTO/index.html) for details on
    this.

3.  **Make all the machines members of the same workgroup.** For the Windows machines
    you set the workgroup name under Network Properties in control panel. For the Linux
    machine, you must edit /etc/smb.conf. Make a backup of the example before editing,
    and change nothing but the workgroup name. The example will serve nicely for
    starters, and you can add shares later. Read the
    [SMB How-to](http://www.tldp.org/HOWTO/SMB-HOWTO.html) for details here.

4.  Finally, you must **load the SMB daemons.** This is covered in detail in the
    [SMB How-to](http://www.tldp.org/HOWTO/SMB-HOWTO.html). Note that some Linux
    distributions may automatically start these daemons at startup if SaMBa is
    installed, so you may want to test it before doing this step. Basically, you edit
    /etc/inetd.conf (make a backup!) and paste in these lines:

        # SAMBA NetBIOS services (for PC file and print sharing)
        netbios-ssn stream tcp nowait root /usr/sbin/smbd smbd
        netbios-ns dgram udp wait root /usr/sbin/nmbd nmbd

Then restart the inetd deamon or (easier) just reboot. (Note: newer distributions may
use `xinetd` rather than inetd.) You should then be able to browse Network Neighborhood
on your Windows boxes and see the Linux box there. You still need a username and
password to access the Linux machine across the network. By default, Windows will send
the same name you used to login to Windows, so you may need to create a new account on
one machine so the user names match.

## Update

Newer versions of Samba come with a handy web-based configuration tool called SWAT. With
many distributions this tool is installed but not enabled by default. To enable it, edit
the file `/etc/inetd.conf`. (Again, you may have xinetd instead.) Find the line
containing SWAT (near the end of the file) and remove the comment symbol (#) from the
front of the line. Save and exit, then restart your inetd (
`/etc/rc.d/init.d/inet restart` ). Once that\'s done, point your web browser to
<http://localhost:9000> and have fun poking around!

## Resources

SaMBa documentation under `/usr/doc/smbfs*/`

man pages smb, smb.conf, smbclient, and smbmount

[The Samba Pages](http://samba.org)
