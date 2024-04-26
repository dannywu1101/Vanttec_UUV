FROM ros:humble-ros-base-jammy

# Install SO dependencies
RUN apt-get update -qq && \
	apt-get install -y \
	build-essential \
	python3-pip -y \
    xboxdrv -y \
    curl \
	--no-install-recommends terminator \
	&& rm -rf /var/lib/apt/lists/*

# Install python dependencies
RUN pip install setuptools==58.2.0

# Adding source command to (root)bashrc file for environment and in ws 
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
RUN echo "source /home/$USERNAME/ws/install/setup.bash" >> /root/.bashrc
RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> /root/.bashrc
RUN echo "export _colcon_cd_root=/opt/ros/humble/" >> /root/.bashrc
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /root/.bashrc