FROM ubuntu:latest

RUN echo "root:root" | chpasswd

ENV user unreal
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd --no-log-init --system --create-home --home-dir /home/${user} --shell /bin/bash  --gid root --uid 1001 ${user}
RUN usermod -a -G sudo unreal
RUN echo "unreal:unreal" | chpasswd

RUN apt-get update --fix-missing && apt upgrade -y && apt install -y \
	tzdata \
	git \
	curl \
	sudo \
	build-essential \
	systemctl \
	ca-certificates supervisor \
	wget \
	xdg-utils \
	&& apt-get clean

RUN mkdir /source

RUN echo "${user}:${user}" | chpasswd

USER ${user}

EXPOSE 7777

WORKDIR /source

VOLUME /source

#CMD /ipmitool.sh \
#	${IDRACIP} \
#	${IDRACUSER} \
#	${IDRACPASSWORD} \
#	${TEMPTHRESHOLD} \
#	${FANSPEEDMIN} \
#	${FANSPEEDMAX} \
#	${DELAY} || : && bash && tail -f /dev/null