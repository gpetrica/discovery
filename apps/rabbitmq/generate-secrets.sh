# export KUBECONFIG=~/.kube/......

kubectl create secret generic rabbitmq-auth \
	--from-env-file=.env \
	-n rabbitmq \
	--dry-run=client -o yaml | kubeseal \
	--controller-name=sealed-secrets-controller \
	--controller-namespace=kube-system \
	-o yaml >rabbitmq-auth-sealed.yaml
