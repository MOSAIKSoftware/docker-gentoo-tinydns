# Tinydns via Docker

## Building

Clone this repository and issue the following command inside the top directory:
```sh
docker build -t mosaiksoftware/gentoo-tinydns .
```

## Starting

Start the container and carry out the initial configuration steps:
```sh
docker run \
	-ti \
	-v /srv/tinydns:/etc/tinydns \
	mosaiksoftware/gentoo-tinydns \
	bash
tinydns-conf tinydns dnslog /etc/tinydns 1.2.3.4
cd /service/tinydns/root
./add-ns example.com 1.2.3.4
make
```

This creates the appropriate configuration at `/srv/tinydns` on the host.

Now start the actual container:
```sh
docker run \
	-ti \
	--name=tinydns \
	-v /srv/tinydns:/etc/tinydns \
	mosaiksoftware/gentoo-tinydns
```
