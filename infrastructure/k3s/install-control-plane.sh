#!/bin/bash

echo "Installing k3s control plane..."

curl -sfL https://get.k3s.io | sh -

echo "Waiting for node to become ready..."
sleep 10

kubectl get nodes

echo "K3s installation complete."
