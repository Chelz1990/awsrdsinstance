c:
	find / -type d  -name ".terraform" -exec rm -rf {} \;

a:
	terraform apply

ay:
	terraform apply -auto-approve

d:
	terraform destroy 

dy: 
	terraform destroy -auto-approve

i:
	terraform init

p:
	terraform plan
