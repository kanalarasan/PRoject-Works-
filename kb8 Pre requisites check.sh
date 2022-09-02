#!/bin/bash

echo "Checking pre-reusities"
echo "##########################################################################################"
echo "### To check swap and memory###"
free -g

echo "### To check kernel.sem & vm.max_map_count###"
cat /etc/sysctl.conf | grep -i -e "kernel.sem" -e "vm.max_map_count"

echo "### To check docker version###"
docker --version

echo "### To check Kubelet and Kubectl versions###"
kubelet --version && kubeadm version
rpm -qa | grep -i "kube*"

echo "### To check Kb8 Certificate Status"
sudo openssl x509 -in /etc/kubernetes/pki/apiserver.crt -noout -text |grep ' Not '

echo "### Pod Status###"
kubectl get pods -A -o wide


echo "### Node Status###"
kubectl get nodes -A -o wide
