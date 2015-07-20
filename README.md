# ec2-net-utils

Port of Amazon Linux ec2-net-utils to Ubuntu

## Install

This package is hosted on [Launchpad](https://launchpad.net/~expert360/+archive/ubuntu/ppa).
Add the PPA and `sudo apt-get install ec2-net-utils`.

## Building

The source package is built in a reproducible fashion using Docker. Follow these steps:

    localhost$ export VERSION=0.2
    localhost$ docker build --tag=ec2-net-utils-bilder .
    localhost$ docker run \
        -v /path/to/.gnupg:/home/expert360/.gnupg \
        -v $(pwd)/ec2-net-utils-$VERSION:/home/expert360/ec2-net-utils-$VERSION \
        -it --rm ec2-net-utils-bilder bash

Then within the interactive container:

    expert360@<containerid>:~$ export VERSION=0.2
    expert360@<containerid>:~$ cd ec2-net-utils-$VERSION
    expert360@<containerid>:~$ debuild -S
    <Enter GPG passphrase when asked>
    expert360@<containerid>:~$ dput expert360:expert360/ppa ../ec2-net-utils_$VERSION_source.changes
