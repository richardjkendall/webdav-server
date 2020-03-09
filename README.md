# webdav-server
Docker image with Apache httpd configured as a webdav server, implements basic authentication using user details stored in a DynamoDB table.

Basic auth uses a PAM module and mod_authnz_pam (https://github.com/adelton/mod_authnz_pam).

The PAM module is here https://github.com/richardjkendall/pam-dynamo.

The docker image is available here https://hub.docker.com/r/richardjkendall/webdav-server

## How to use

Pull the docker image ``docker pull richardjkendall/webdav-server:latest``

### Volumes
You should mount the following folders on external volumes otherwise you will lose data when you reploy the container

|Container Path|Purpose|
|---|---|
|/dav/root|Folder where files are stored|
|/dav/db|Folder where DAV lockdb is stored|

### Environment variables
The following variables need to be set for the container to set up the PAM module for authentication properly

|Variable|Purpose|
|---|---|
|REGION|AWS region|
|TABLE|Name of DynamoDB table|
|REALM|Name of realm where users should exist|

For more details on the structure of the table which is expected, please see here https://github.com/richardjkendall/pam-dynamo#expected-table-structure
