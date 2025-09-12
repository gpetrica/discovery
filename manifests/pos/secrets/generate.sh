kubectl create secret generic pos-secrets \
	--from-env-file=/Users/petrica/Work/zuppler/services/zuppler-pos/.env \
	--namespace=pos \
	--dry-run=client -o yaml >pos-secrets.yaml

kubeseal \
	--controller-name=sealed-secrets-controller \
	--controller-namespace=kube-system \
	--format yaml <pos-secrets.yaml >../overlays/dev/pos-sealed.yaml
