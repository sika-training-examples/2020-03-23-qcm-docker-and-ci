create-cert:
	@[ "${HOST}" ] || ( echo "HOST is required"; exit 1 )

	minica --domains ${HOST}

deploy-cert:
	@[ "${HOST}" ] || ( echo "HOST is required"; exit 1 )

	scp minica.pem root@${HOST}:/etc/docker/ca.pem
	scp ${HOST}/cert.pem root@${HOST}:/etc/docker/cert.pem
	scp ${HOST}/key.pem root@${HOST}:/etc/docker/key.pem

	mkdir ~/.docker/${HOST}
	cp minica.pem ~/.docker/${HOST}/ca.pem
	cp ${HOST}/cert.pem ~/.docker/${HOST}/cert.pem
	cp ${HOST}/key.pem ~/.docker/${HOST}/key.pem
