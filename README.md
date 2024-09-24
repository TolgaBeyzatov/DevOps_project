# postcount-service-project
The name of repo for the Postcount service Python app. Exercise for a project.

Python service called "postcount-service".

It maintains a web page with a counter for the number of POST requests it has served and return it for every GET request it gets.

### Steps for building and running the application 

When ready, start the application by running: 
`docker compose up --build`.

The application will be available at http://localhost:8080.

### Deploying the application to the cloud 

First, build your image, e.g.: `docker build -t myapp .`.
If your cloud uses a different CPU architecture than your development machine (e.g., you are on a Mac M1 and your cloud provider is amd64), you will want to build the image for that platform, e.g.:
`docker build --platform=linux/amd64 -t myapp .`.

Then, push it to your registry, e.g. `docker push myregistry.com/myapp`.

Consult Docker's [getting started](https://docs.docker.com/get-started/workshop/04_sharing_app/) docs for more detail on building and pushing.

### References
* [Docker's Python guide](https://docs.docker.com/guides/language/python/)