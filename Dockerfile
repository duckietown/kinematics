FROM ros:kinetic

RUN apt-get update && apt-get install -y build-essential ros-kinetic-tf-conversions

# Add the project to the container's /app directory
ADD . /catkin_ws/src/docker_sample

# Build our catkin workspace from the /catkin_ws directory
WORKDIR /catkin_ws
RUN /ros_entrypoint.sh catkin_make

CMD /catkin_ws/devel/lib/kinematics/pose_to_path_node
