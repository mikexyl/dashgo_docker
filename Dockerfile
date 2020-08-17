FROM ros:kinetic-perception-xenial

ENV UBUNTU_VERSION=xenial

ENV ROS_VERSION=kinetic

RUN apt update && apt install python-catkin-tools wget -y

RUN apt install autoconf -y

RUN apt install curl -y

ARG myuser
RUN useradd -ms /bin/bash $myuser
RUN usermod -a -G dialout $myuser

RUN apt install git python-serial g++ -y
RUN apt install ros-${ROS_VERSION}-serial -y
RUN apt install ros-${ROS_VERSION}-teleop-twist-keyboard -y
RUN apt install ros-${ROS_VERSION}-move-base-msgs -y
RUN apt install libghc-sdl-image-dev -y
RUN apt install libsdl-imag* -y
RUN apt install ros-${ROS_VERSION}-teb-local-planner -y

RUN apt install usbutils -y
RUN apt install ros-${ROS_VERSION}-yujin-ocs -y

RUN apt install npm -y
RUN npm install vue

RUN apt install python-pip -y
#RUN pip install http

RUN apt install ros-${ROS_VERSION}-rosbridge-suite -y

COPY dashgo_entrypoint.sh /
COPY dashgo_startup.sh /

