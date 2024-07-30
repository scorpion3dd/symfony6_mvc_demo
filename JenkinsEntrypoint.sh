#!/bin/bash
sudo chown -R agentjenkinsphp:agentjenkinsphp /var/log
sudo chmod -R 777 /var/log
exec "$@"
