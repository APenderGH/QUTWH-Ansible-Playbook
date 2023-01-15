#!/bin/bash
apt-get update -y
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

