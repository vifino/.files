#!/usr/bin/env zsh

# Kubernetes
hasbin kubectl && source <(kubectl completion zsh)
hasbin kubeadm && source <(kubeadm completion zsh)
