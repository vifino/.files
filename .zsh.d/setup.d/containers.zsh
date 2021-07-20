#!/usr/bin/env zsh

# Kubernetes
if hasbin kubectl; then
	source <(kubectl completion zsh)

	# Set the default kube context if present
	DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
	if test -f "${DEFAULT_KUBE_CONTEXTS}"; then
		export KUBECONFIG="$DEFAULT_KUBE_CONTEXTS"
	fi

	# Additional contexts should be in ~/.kube/contexts
	CUSTOM_KUBE_CONTEXTS="$HOME/.kube/contexts"
	mkdir -p "${CUSTOM_KUBE_CONTEXTS}"

	EXTRA="$(find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yml" | tr -s '\n' ':' )"
	export KUBECONFIG="$KUBECONFIG:$EXTRA"
fi

hasbin kubeadm   && source <(kubeadm completion zsh)
hasbin kubectl   && source <(kubectl completion zsh)
hasbin kubecolor && alias kubectl="kubecolor" && complete -o default -F __start_kubectl kubecolor
hasbin helm      && source <(helm    completion zsh)
