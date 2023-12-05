cleanup:
	find / -type d  -name ".terraform" -exec rm -rf {} \;

app:
	terraform apply -auto-approve

del:
	terraform destroy -auto-approve

ini:
	terraform init