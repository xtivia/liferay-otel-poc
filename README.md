# OpenTelemetry/Liferay POC #

This repository has some basic files allowing you to spin up a Jaeger container and a Liferay container instrumented with the OpenTelemetry Java library.

## Files/Directories ##

* *README.md* - This file
* *docker-setup-liferay-network.sh* - Bash script to create a custom docker network for Jaeger/Liferay.
* *docker-start-jaeger.sh* - Bash script to start the Jaeger container.
* *docker-start-liferay.sh* - Bash script to start the Liferay container.
* *liferay-home* - The directory containing files to be copied to the Liferay home directory.

## Instructions ##

When starting the containers for the first time, run the `docker-setup-liferay-network.sh` script.  This will create a custom network to be used for communication between the Liferay and Jaeger containers.

Next up, run the `docker-start-jaeger.sh` script.  This will start up the Jaeger container; the UI will be available on http://localhost:16686/.

Finally, run the `docker-setup-liferay-network.sh` script to start the Liferay container.  Liferay will be available on http://localhost:8080/.

