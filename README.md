docker-heka
=============

Heka stream processing docker container.


Build
-----

To create the image `bbinet/heka`, execute the following command in the
`docker-heka` folder:

    docker build -t bbinet/heka .

You can now push the new image to the public registry:
    
    docker push bbinet/heka


Run
---

The heka container will read its configuration from toml file located in the
"/config" volume that you need to mount.

For example:

    $ docker pull bbinet/heka

    $ docker run --name heka \
        -v $(pwd)/config:/etc/heka/conf.d \
        bbinet/heka
