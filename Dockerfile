FROM ubuntu:trusty

MAINTAINER Expert360 <dev@expert360.com>

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --force-yes --assume-yes packaging-dev

# Create a user specifically for building packages
RUN groupadd -r expert360 && useradd -m -g expert360 expert360
USER expert360

# debuild needs GPG keychain to sign packages
ENV GNUPGHOME=/home/expert360/.gnupg \
    DEBEMAIL=dev@expert360.com \
    DEBFULLNAME="Expert360 Dev Team"

COPY dput.cf /home/expert360/.dput.cf
VOLUME /home/expert360/.gnupg
WORKDIR /home/expert360
