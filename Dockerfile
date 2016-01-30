FROM       hasufell/gentoo-amd64-paludis:latest
MAINTAINER Julian Ospald <hasufell@posteo.de>


##### PACKAGE INSTALLATION #####

# copy paludis config
COPY ./config /etc

# update world with our USE flags
# install znc set
# install tools set
# update etc files... hope this doesn't screw up
RUN chgrp paludisbuild /dev/tty && cave resolve -c world -x \
	chgrp paludisbuild /dev/tty && cave resolve -c tinydns -x \
	chgrp paludisbuild /dev/tty && cave resolve -c tools -x \
	etc-update --automode -5 \
  ln -s /etc/tinydns /service/tinydns



EXPOSE 53/udp 10000/tcp


CMD exec /usr/bin/supervisord -n -c /etc/supervisord.conf
