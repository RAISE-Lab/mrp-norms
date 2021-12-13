source ros_ws/devel/setup.zsh
export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}${GAZEBO_MODEL_PATH:+:}`pwd`/ros_ws/models
export GAZEBO_RESOURCE_PATH=${GAZEBO_RESOURCE_PATH}${GAZEBO_RESOURCE_PATH:+:}`pwd`/ros_ws/models
