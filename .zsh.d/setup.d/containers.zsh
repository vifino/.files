#!/usr/bin/env zsh

# Kubernetes
if hasbin kubectl; then
	source <(kubectl completion zsh)

	if test -z "$KUBECONFIG"; then
		# Set the default kube context if present
		DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
		if test -f "${DEFAULT_KUBE_CONTEXTS}"; then
			export KUBECONFIG="$KUBECONFIG:$DEFAULT_KUBE_CONTEXTS"
		fi

		# Additional contexts should be in ~/.kube/contexts
		CUSTOM_KUBE_CONTEXTS="$HOME/.kube/contexts"
		mkdir -p "${CUSTOM_KUBE_CONTEXTS}"

		EXTRA="$(find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yml" | sed 's/\n+/:/g' )"
		export KUBECONFIG="$EXTRA$KUBECONFIG"

	fi
fi

hasbin kubeadm && source <(kubeadm completion zsh)
hasbin helm    && source <(helm    completion zsh)
