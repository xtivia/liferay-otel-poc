#!/bin/bash

docker pull liferay/dxp:7.3.10-ga1

docker run -m 4g -p 8080:8080 --net liferay-net -v $(pwd)/liferay-home:/mnt/liferay -e JAVA_VERSION=zulu11 liferay/dxp:7.3.10-ga1
