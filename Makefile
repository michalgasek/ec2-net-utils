NAME=ec2-net-utils
VERSION=0.1

.PHONY: package
package:
	fpm \
		-n $(NAME) \
		-v $(VERSION) \
		--description "Port of ec2-net-utils from Amazon Linux to Ubuntu" \
		--architecture all \
		--license MIT \
		--maintainer jsok@expert360.com \
		--url http://github.com/expert360/ec2-net-utils \
		--after-install postinst \
		-t deb \
		-s dir ./src/=/
