README
======

Bash script to update the ip of an account on no-ip.com
customized for dd-wrt router

How to use
----------

* Configure the script with the correct username, password, hostname, cache file (current IP), and log file
* Make it executable (`chmod +x noipupdater.sh`)
* Run it (`./noipupdater.sh`)

Tips!
-----

Place this in your cron file:

    */15 * * * * /root/noipupdater.sh

This will run the script every fifteen minutes.

Note: Some users have had problem executing the cron. If that is your case, remove the `.sh` extension.

Happy updating!
