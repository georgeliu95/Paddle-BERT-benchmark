#!/bin/bash
apt install -y vim git

#pip install cupy-cuda100

#dpkg -i requirements/NVIDIA_Nsight_Systems_Linux_CLI_Only_2020.3.1.72.deb


#echo "export PATH=$PATH:/usr/local/cuda-10.0/bin" >> ~/.bashrc
#echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.0/lib64" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/cuda-10.0/compat" >> ~/.bashrc
#echo "alias nsys=/opt/nvidia/nsight-systems-cli/2020.3.1/target-linux-x64/nsys" >> ~/.bashrc