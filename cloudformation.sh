#!/bin/bash


STACK_NAME="Pentaho"
VPC_ID="vpc-f3c9f796"
KEYPAIR_NAME="ras-eu-west-1"
DB_NAME="pentahodb"
DB_USER="pentahouser"
DB_PASS="pentahopass"

AWS_USER="wellnet-ras"

#sudo -u "$AWS_USER" aws cloudformation delete-stack --stack-name $STACK_NAME
sudo -u "$AWS_USER" aws cloudformation create-stack\
    --stack-name "$STACK_NAME" \
    --template-body file://cloudformation.json \
    --parameters \
        ParameterKey=VPCId,ParameterValue="$VPC_ID" \
        ParameterKey=KeyName,ParameterValue="$KEYPAIR_NAME" \
        ParameterKey=DBName,ParameterValue="$DB_NAME" \
        ParameterKey=DBUser,ParameterValue="$DB_USER" \
        ParameterKey=DBPassword,ParameterValue="$DB_PASS" \
        ParameterKey=MultiAZDatabase,ParameterValue=false
