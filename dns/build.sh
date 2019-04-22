#!/bin/bash
docker build -t gcr.thundr.me/thundr/midasarray/dns .
docker push gcr.thundr.me/thundr/midasarray/dns:latest