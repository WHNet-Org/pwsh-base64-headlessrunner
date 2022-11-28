
# pwsh-base64-headlessrunner
WARNING: Still a work in progress !!!

Allows you to execute a base64 converted PowerShell script.

### Features
- Updates on an FQDN basis
- Configurable timer (sleep) between updates
- Doesn't update if the the IP haven't changed to prevent audit logs spam
- Very lightweight
- Docker compatible, using Alpine Linux !

### Environment variables

- ```Payload```
	- Your base64 PowerShell script

# Docker

You can use all the above environment variables. You can also bind-mount your ```Env.ps1``` files in ```/code/Conf/Env.ps1```.

### Build it yourself !
Build steps are pretty easy. Just remember to change the FROM image at line 1 of the ```Dockerfile``` because we are using our own internal docker image caching.

### Notes
The logging in the container's console output is not working as intended. Although it is readable, it will be fixed soon.
