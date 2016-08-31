#!/bin/bash

echo "Creating 2G SWAP File:"

# Create the SWAP file
fallocate -l 2G /swapfile
ls -lh /swapfile

# only let root use it
echo "Setting permissions:"
chmod 600 /swapfile
ls -lh /swapfile

# Makr the file as SWAP
mkswap /swapfile

# Enable the swap file for use right now
swapon /swapfile

echo "Verifying SWAP is on:"
swapon --show

free -h

echo "Backing up fstab file"
cp /etc/fstab /etc/fstab.bak

echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

sysctl vm.swappiness=10

echo 'vm.swappiness=10' | tee -a /etc/sysctl.conf

sysctl vm.vfs_cache_pressure=50

echo vm.vfs_cache_pressure=50 | tee -a /etc/sysctl.conf

echo 'Done Making SWAP!'
