#!/bin/bash
set -e

NODE_IP=$(hostname -I | awk '{print $1}')

echo "Installing k3s control plane on $NODE_IP"

curl -sfL https://get.k3s.io | \
INSTALL_K3S_EXEC="--disable traefik --node-ip=$NODE_IP" \
sh -

mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

echo "Cluster ready."
