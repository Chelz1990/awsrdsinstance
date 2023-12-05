c:
	find / -type d  -name ".terraform" -exec rm -rf {} \;

a:
	terraform apply -auto-approve

d:
	terraform destroy -auto-approve

i:
	terraform init

p:
	terraform plan
