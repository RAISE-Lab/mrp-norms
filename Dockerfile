FROM osrf/ros:melodic-desktop-full

LABEL maintainer="Cheng Lin <cheng.lin2@mail.mcgill.ca>"

# update deprecated apt key
RUN apt-key del EXPKEYSIG F42ED6FBAB17C654
RUN sudo -E apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    libv4l-dev \
    libv4l2rds0 \
    git \
    wget \
    vim \
    locales \
    dpkg \
    ssh \
    curl \
    aptitude \
    g++ \
    gcc \
    openvpn \
    gnupg \
    bash-completion \
    vim-gnome \
    nano \
    psmisc \
    ccache \
    gdb \
    qtcreator \
    htop \
    man \
    meld \
    silversearcher-ag \
    terminator \
    tig \
    valgrind \
    iputils-ping \
    ipython \
    python-scipy \
    python-wstool \
    python-networkx \
    python-pip  \
    python3-vcstool \
    python-rosinstall \
    python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

ARG ROSDEP_IGNORE="opencv2 opencv2-nonfree pal_laser_filters speed_limit_node sensor_to_cloud hokuyo_node libdw-dev python-graphitesend-pip python-statsd pal_filters pal_vo_server pal_usb_utils pal_pcl pal_pcl_points_throttle_and_filter pal_karto pal_local_joint_control camera_calibration_files pal_startup_msgs pal-orbbec-openni2 dummy_actuators_manager pal_local_planner gravity_compensation_controller current_limit_controller dynamic_footprint dynamixel_cpp tf_lookup opencv3"

RUN sudo apt-get update && rosdep install --from-paths src --ignore-src -y --rosdistro melodic --skip-keys="${ROSDEP_IGNORE}"

RUN sudo apt install ros-melodic-gazebo-plugins ros-melodic-rqt-robot-steering ros-melodic-rviz-imu-plugin ros-melodic-joint-state-publisher-gui

RUN bash -c "source /opt/ros/melodic/setup.bash \
    && catkin build -DCATKIN_ENABLE_TESTING=0"

ENTRYPOINT ["bash"]