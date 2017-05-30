
lib:
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install -y git autoconf automake build-essential libtool cmake realpath python-dev aptitude ufw vim lynx
	sudo apt-get install -y libacl1 libc-ares-dev libcunit1 libcunit1-dev libev-dev libevent-2.0-5 libevent-dev libevent-extra-2.0-5 libevent-openssl-2.0-5 libevent-pthreads-2.0-5 libjansson-dev libjemalloc-dev libjemalloc1 libmount1 libssl-dev systemd libxml++2.6-dev

nginx:
	sudo apt-get install -y nginx
	sudo ufw enable
	sudo ufw allow 'Nginx FULL'
	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj /CN=localhost -passout pass:1234 -nodes
	sudo mkdir -p /etc/nginx/ssl
	sudo cp cert.pem key.pem /etc/nginx/ssl/
	rm -f cert.pem key.pem
	sudo cp nginx.conf /etc/nginx/
	sudo cp default /etc/nginx/sites-available/
	sudo systemctl restart nginx
