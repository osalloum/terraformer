#!/bin/bash
docker build -t tfer:v1 . 
aws-vault exec dev -- docker run  -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" -e AWS_SECURITY_TOKEN="$AWS_SECURITY_TOKEN" --platform linux/amd64 -v $PWD:/root/terraformer -e AWS_REGION=eu-west-1  -it --rm tfer:v1  bash
