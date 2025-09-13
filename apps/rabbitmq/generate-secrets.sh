# export KUBECONFIG=~/.kube/......

kubectl create secret generic rabbitmq-auth \
	--from-env-file=.env \
	-n rabbitmq \
	--dry-run=client -o yaml >rabbitmq-auth.yaml

kubeseal \
	--controller-name=sealed-secrets-controller \
	--controller-namespace=kube-system \
	-o yaml <rabbitmq-auth.yaml >rabbitmq-auth-sealed.yaml

rm rabbitmq-auth.yaml
