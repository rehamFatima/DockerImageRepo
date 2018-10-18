FROM ubuntu:14.04

RUN apt-get update && \
      apt-get -y install sudo
	  
RUN  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev unzip mcl libgtk2.0-dev r-base-core     \
libcurl4-gnutls-dev python-rpy2 git

RUN && apt-get -y install git \
	&& git config --global user.name "rehamFatima"	\
    && git config --global user.email "reham@ebi.ac.uk"	\
    
    && cd lib	\
	&& git clone https://github.com/gt1/libmaus2.git \	
    && cd libmaus2  \
	&& sudo apt-get -y install libtool m4 automake \
	&& libtoolize  \
    && aclocal 	\
    && autoheader 	\
	&& automake --force-missing --add-missing 	\
	&& autoconf \
	&& ./configure --prefix=/Mug/lib/libmaus2 	\
	
	&& make  \
    && make install \
	&& cd /Mug/lib 	\
	
	
	&& git clone https://github.com/gt1/biobambam2.git 	&& cd biobambam2 	\
	&& autoreconf -i -f	&& ./configure --with-libmaus2=/Mug/lib/libmaus2 --prefix=/Mug/lib/biobambam2	\
    && make install
	
	#&& make	 && make install
	
	
#RUN mkdir Biobambam
#RUN cd Biobambam
#RUN pwd