FROM ros:kinetic-robot-xenial

ENV UBUNTU_VERSION=xenial

ENV ROS_VERSION=kinetic

RUN apt update && apt install python-catkin-tools wget -y

RUN apt install autoconf -y

RUN apt install curl -y

ARG myuser
RUN useradd -ms /bin/bash $myuser
RUN usermod -a -G dialout $myuser

RUN apt install git python-serial ros-${ROS_VERSION}-serial g++ \
ros-${ROS_VERSION}-turtlebot-rviz-launchers ros-${ROS_VERSION}-teleop-twist-keyboard \
ros-${ROS_VERSION}-move-base-msgs libghc-sdl-image-dev libsdl-imagK2.2-dev \
ros-${ROS_VERSION}-navigation ros-${ROS_VERSION}-slam-gmapping ros-${ROS_VERSION}-teb-local-planner -y
