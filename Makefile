
lib:
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install -y git autoconf automake build-essential libtool cmake realpath python-dev aptitude ufw vim lynx sysstat
	sudo apt-get install -y libacl1 libc-ares-dev libcunit1 libcunit1-dev libev-dev libevent-2.0-5 libevent-dev libevent-extra-2.0-5 libevent-openssl-2.0-5 libevent-pthreads-2.0-5 libjansson-dev libjemalloc-dev libjemalloc1 libmount1 libssl-dev systemd libxml++2.6-dev util-linux python-pip mysql-client libmysqlclient-dev
	sudo pip install --upgrade pip
	sudo pip install sh
	sudo pip install jinja2
	sudo pip install pexpect
	sudo pip install MySQL-python

nginx:
	sudo apt-get remove -y nginx nginx-core nginx-full nginx-common
	sudo apt-get purge -y nginx nginx-core nginx-full nginx-common
	sudo apt-get install -y nginx-full
	sudo ufw allow 'Nginx FULL'
	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj /CN=localhost -passout pass:1234 -nodes
	sudo mkdir -p /etc/nginx/ssl
	sudo chown -R sohamcodes:sohamcodes /etc/nginx/
	sudo chown -R sohamcodes:sohamcodes /var/log/nginx/
	cp cert.pem key.pem /etc/nginx/ssl/
	rm -f cert.pem key.pem
	cp nginx.conf /etc/nginx/
	cp default /etc/nginx/sites-available/
	sudo ufw disable
	sudo systemctl stop nginx
