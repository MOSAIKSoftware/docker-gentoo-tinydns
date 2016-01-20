FROM       hasufell/gentoo-amd64-paludis:latest
MAINTAINER Julian Ospald <hasufell@posteo.de>


##### PACKAGE INSTALLATION #####

# copy paludis config
COPY ./config/paludis /etc/paludis

# update world with our USE flags
RUN chgrp paludisbuild /dev/tty && cave resolve -c world -x

# install znc set
RUN chgrp paludisbuild /dev/tty && cave resolve -c tinydns -x

# install tools set
RUN chgrp paludisbuild /dev/tty && cave resolve -c tools -x

# update etc files... hope this doesn't screw up
RUN etc-update --automode -5

################################


RUN ln -s /etc/tinydns /service/tinydns


COPY supervisord.conf /etc/supervisord.conf

EXPOSE 53/udp 10000/tcp


CMD exec /usr/bin/supervisord -n -c /etc/supervisord.conf
