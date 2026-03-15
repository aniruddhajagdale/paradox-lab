#!/bin/bash
set -e

echo "Updating system..."
sudo apt update
sudo apt upgrade -y

echo "Installing utilities..."
sudo apt install -y git curl jq

echo "Disabling swap..."
sudo dphys-swapfile swapoff
sudo systemctl disable dphys-swapfile

echo "Enabling memory cgroups..."
if ! grep -q cgroup_memory /boot/firmware/cmdline.txt; then
  sudo sed -i '1 s/$/ cgroup_memory=1 cgroup_enable=memory/' /boot/firmware/cmdline.txt
fi

echo "Bootstrap complete. Reboot required."
