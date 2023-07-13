FROM ruby:3.0.6-bullseye

RUN apt-get update &&\
	apt-get install -y --no-install-recommends git curl &&\
	rm -rf /var/lib/apt/lists/*

# Using ImageMagick Easy Install (IMEI) system because it is a thoroughly tested, open source installation system for ImageMagick
RUN git clone https://github.com/SoftCreatR/imei /tmp/imei
RUN cd /tmp/imei && openssl dgst -sha512 -verify imei.sh.pem -signature imei.sh.sig imei.sh

ENV IMAGE_MAGICK_VERSION=7.1.1-12
RUN cd /tmp/imei && bash imei.sh --imagemagick-version "$IMAGE_MAGICK_VERSION"
RUN ldconfig /usr/local/lib 
