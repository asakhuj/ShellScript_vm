#!/bin/bash 
STR="y" 
one="1"
two="2"
echo "Do you want to continue with the configuration of VM,if Yes , press y"
read answer


if [ "$STR" = "$answer" ]
then
    echo "Enter the name of your VM"
	read name_vm
	echo "Enter the number of CPU required"
	read cpu_vm
	echo "Enter the storage required"
	read storage_vm
	echo "Enter the RAM"
	read ram_vm
	echo "Enter the image location"
	read image_vm
        echo "Enter the networks you need. Choose a value between 1-2"
        read no_of_interfaces
        echo no_of_interfaces
        echo "$one" = "$no_of_interfaces" -o  "$two" = "$no_of_interfaces"
        if [ "$one" = "$no_of_interfaces" -o "$two" = "$no_of_interfaces" ]
        then
             echo "You have chosen one"
	     echo "Enter the network name. The available networks are :"
	     virsh net-list 
	     read network_vm
             
        fi
        if [ "$two" = "$no_of_interfaces" ]
        then
            echo "Enter the value of second network"
            read network2_vm
            flag=1

        fi
	echo "Please wait....."
	


echo "test1111 entering"
#Other installations

#Installing required packages

#checking if libvirt is already installed
if [ $(dpkg-query -W -f='${Status}' libvirt-bin 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install libvirt-bin;
  echo "libvirt-bin installed"
  sudo adduser $USER libvirtd
fi

#checking if qemu-kvm packages exists
if [ $(dpkg-query -W -f='${Status}' qemu-kvm 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install qemu-kvm;
  echo "qemu-kvm installed"
fi

#Installing bridge-utils
if [ $(dpkg-query -W -f='${Status}' bridge-utils 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install bridge-utils;
  echo "bridge utilities installed"
fi

# Installing virtinst
if [ $(dpkg-query -W -f='${Status}' virtinst 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install virtinst;
  echo "virtinst installed"
fi

# check for virt-manager
if [ $(dpkg-query -W -f='${Status}' virt-manager 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install virt-manager;
  echo "virt-manager installed"
fi

# Install virt-viewer
if [ $(dpkg-query -W -f='${Status}' virt-viewer 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install virt-viewer;
  echo "virt-manager installed"
fi

echo "test 1exit "

echo "$no_of_interfaces" = "$one"
echo "$no_of_interfaces" = "$two"
echo $flag
#if ["$no_of_interfaces" = "$one"]
#then
#    echo "1111"
#    sudo virt-install --name ${name_vm} --ram ${ram_vm}  --vcpu=${cpu_vm} --disk path=/var/lib/libvirt/images/${name_vm}.img,bus=virtio,size=${storage_vm} -c ${image_vm} --network network=${network_vm},model=virtio --noautoconsole -v
#fi

#if [${flag}]
#then
echo "222222222222"
sudo virt-install --name ${name_vm} --ram ${ram_vm} --network network=${network2_vm} --vcpu=${cpu_vm} --disk path=/var/lib/libvirt/images/${name_vm}.img,bus=virtio,size=${storage_vm} -c ${image_vm} --network network=${network_vm},model=virtio --noautoconsole -v
#fi

echo "VM ${name_vm} Created"


else
    echo "Exiting the application"
fi
