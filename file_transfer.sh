#!/bin/bash

# Define variables
SOURCE_FILE="example.txt"
DESTINATION_IP="<destination-instance-ip>"
DESTINATION_USER="<user>" 
DESTINATION_DIR="/path/to/destination_dir"
DESTINATION_PRIVATE_KEY="/path/to/destination/private-key.pem"

# Transfer the file using SCP with destination private key
scp -i $DESTINATION_PRIVATE_KEY $SOURCE_FILE $DESTINATION_USER@$DESTINATION_IP:$DESTINATION_DIR

#enable verbose if necessary to view in detail
# scp -v -i $DESTINATION_PRIVATE_KEY $SOURCE_FILE $DESTINATION_USER@$DESTINATION_IP:$DESTINATION_DIR

# Note:-
 #Error:- The error message indicates that the permissions on your SSH private key file (pem file) are too open, which is why the key is being ignored. SSH requires that your private key file is only readable by you (the file owner).
 #Solution:- pem file should have only 400 permission (chmod 400 pem_file)
