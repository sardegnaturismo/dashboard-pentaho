#!/bin/bash
#
# START/STOP etl-dasbhoard instance
#

INSTANCE_ID="i-187a3792"


function ec2_status {
        aws ec2 describe-instance-status --instance-ids $INSTANCE_ID
}

function ec2_start {
        echo "START"
        aws ec2 start-instances --instance-ids $INSTANCE_ID
}

function ec2_stop {
        echo "STOP"
        aws ec2 stop-instances --instance-ids $INSTANCE_ID
}


if [ "$1" == "start" ]; then
        ec2_start
elif [ "$1" == "stop" ]; then
        ec2_stop
elif [ "$1" == "status" ]; then
        ec2_status
else
        ec2_status
fi
