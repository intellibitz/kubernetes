#!/bin/sh

sudo apt-get -y remove kubelet kubeadm kubectl
sudo apt-get -y update && \
sudo apt-get -y install apt-transport-https ca-certificates curl

sudo mkdir -m 0755 -p /etc/apt/keyrings
sudo rm /etc/apt/keyrings/kubernetes-archive-keyring.gpg
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
sudo chmod a+r /etc/apt/keyrings/kubernetes-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ \
  kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

sudo apt-get -y update && \
sudo apt-get -y install kubelet kubeadm kubectl
