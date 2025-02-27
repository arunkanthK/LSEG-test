EC2 Metadata to JSON Script
Purpose
This script queries various EC2 instance metadata and formats the output as a JSON object. It is useful for obtaining structured information about an EC2 instance in a format that can be easily consumed by other applications or services.
Requirements

jq: A lightweight and flexible command-line JSON processor.
ec2-metadata: A tool to query EC2 instance metadata.

Installation
Installing jq
On Amazon Linux or CentOS:
sudo yum install -y jq

On Ubuntu or Debian:
sudo apt-get install -y jq

On macOS (using Homebrew):
brew install jq

Installing ec2-metadata
Ensure that the ec2-metadata tool is installed on your EC2 instance. It is typically available by default on Amazon Linux AMIs. If not, you can install it using the package manager.
Usage


Ensure jq is installed:

The script checks if jq is installed. If not, it prompts the user to install jq and exits.



Run the Script:

Save the script to a file, for example, ec2_metadata_to_json.sh.
Make the script executable:chmod 777 ec2_metadata_to_json.sh


Execute the script:./ec2_metadata_to_json.sh





Output:

The script will output a JSON object containing various pieces of EC2 instance metadata.



Script Details
The script queries the following EC2 metadata:

Instance ID
Instance Type
AMI ID
Local Hostname
Public Hostname
Local IPv4
Public IPv4
Security Groups
Availability Zone
