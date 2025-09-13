# export KUBECONFIG=~/.kube/......

kubectl create secret generic rabbitmq-auth \
	--from-env-file=.env \
	-n pos \
	--dry-run=client -o yaml >rabbitmq-auth.yaml

kubeseal \
	--controller-name=sealed-secrets-controller \
	--controller-namespace=kube-system \
	-o yaml <rabbitmq-auth.yaml >secrets/rabbitmq-auth-sealed.yaml

rm rabbitmq-auth.yaml
