# IdentityServerAdminUIDemo
Identity server admin UI demo project

Downloaded demo project from: https://www.identityserver.com/downloads/adminui.

## Run example

First run ps script:
> startIdS.ps1.

New crt and keys files of the self signed certificate are generated in the cert folder.
To create the pfx file which needs to trusted/imported on the docker host, run:
> sudo openssl pkcs12 -export -out localhost.pfx -inkey localhost.key -in localhost.crt

Import the pfx as trusted root certificate on docker host.

Finally add dns entries to machine host file: 

- 127.0.0.1 ids
- 127.0.0.1 api

The demo app will then be running at the endpoints listed below.

- Admin UI: https://localhost:5010
- Admin api: https://api:5011/swagger
- Identity server: https://ids:5013
