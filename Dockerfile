FROM docker.io/library/debian:10
EXPOSE 22
CMD ["bash"]

RUN apt update
RUN apt upgrade
RUN apt install -y build-essential dirmngr git
RUN echo "deb http://download.atmark-techno.com/debian/ buster main contrib non-free" > /etc/apt/sources.list.d/atmark-techno.list
RUN apt-key adv --keyserver pgp.nic.ad.jp --recv-keys 3874DA771B351757
RUN echo "Package: firmware-atheros\nPin: origin download.atmark-techno.com\nPin-Priority: 1001" > /etc/apt/preferences.d/armadillo-firmware-atheros-pin-1001
RUN echo "Package: firmware-ti-connectivity\nPin: origin download.atmark-techno.com\nPin-Priority: 1001" > /etc/apt/preferences.d/armadillo-firmware-ti-pin-1001
RUN apt update
RUN apt install -y x1-essential a600-essential
