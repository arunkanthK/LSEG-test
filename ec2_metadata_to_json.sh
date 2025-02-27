#!/bin/bash

# Ensure jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install jq and try again."
    exit 1
fi

# Query EC2 metadata
instance_id=$(ec2-metadata -i | awk '{print $2}')
instance_type=$(ec2-metadata -t | awk '{print $2}')
ami_id=$(ec2-metadata -a | awk '{print $2}')
local_hostname=$(ec2-metadata -h | awk '{print $2}')
public_hostname=$(ec2-metadata -p | awk '{print $2}')
local_ipv4=$(ec2-metadata -o | awk '{print $2}')
public_ipv4=$(ec2-metadata -v | awk '{print $2}')
security_groups=$(ec2-metadata -s | awk '{print $2}')
availability_zone=$(ec2-metadata -z | awk '{print $2}')
# Add more queries as needed for other metadata options

# Create JSON output
json_output=$(jq -n \
                  --arg id "$instance_id" \
                  --arg type "$instance_type" \
                  --arg ami "$ami_id" \
                  --arg lhostname "$local_hostname" \
                  --arg phostname "$public_hostname" \
                  --arg lipv4 "$local_ipv4" \
                  --arg pipv4 "$public_ipv4" \
                  --arg sgroups "$security_groups" \
                  --arg azone "$availability_zone" \
                  '{InstanceId: $id, InstanceType: $type, AMIId: $ami, LocalHostname: $lhostname, PublicHostname: $phostname, LocalIPv4: $lipv4, PublicIPv4: $pipv4, SecurityGroups: $sgroups, AvailabilityZone: $azone}')

# Print JSON output
echo "$json_output"
