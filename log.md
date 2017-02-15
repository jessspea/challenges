<h1>Challenges</h1>
**Challange 1**</br>
**Install any linux distribution using vagrant**</br>
*Bonus if you install Centos 7 because we use that.*
- Installed Vagrant
- Installed Virtual Box
- Made a vagrant root directory and called this vagrant_test
- CD into that directory and made vagrant configuration file
	- Used `vagrant init centos/7`
- Added the centos7 box with `vagrant box add centos/7` 
	- Selected option 2 for using with virtual box
- Next I booted up the environment by using `vagrant up`
- We can then ssh into the machine using vagrant ssh<br />

**Challange 2**</br>
**Create a git repository in Github with a single *MARKDOWN* file called log.md to quickly present your steps for every challenge.**
- Created a github account
- Created a git repo and called this challanges
- Created a log.md file
- Cloned this to my local machine
- Made changes on local machine and staged using git add
- I used git commit and then git push to send local changes to remote repo<br />

**Install Centos 7 from scratch in VirtualBox. Use that box to create a Vagrant Base Box.**
- Downloaded Centos 7 
- Added vm using virtualbox app wizard
	- Named the vm Centos 7
	- Set operating system to Linux and version to redhat
	- Used the recommended memory size of 1024mb
	- Used the recommended hard disk size of 8gb
	- I then went to settings and disabled audio and usb controller
	- Then I went to storage tab in controller ID and selected centos iso image
- I powered up the vm and installed centos 7 using the GUI
	- Checked and varified installation source
	- I set the partitioning to automatic
	- I then set the root password and created a vagrant user
	- After rebooting and logging in as root. There was no network connection due to Ethernet interface not enabled
	- I was able to run `nmxli d` to check ethernet card is installed and if its connected
	- I opened the network config for this using `vi /etc/sysconfig/network-scripts/ifcfg-enp0s3`
	- I edited the file so that BOOTPROTO is set to dhcp and ONBOOT set to yes.
	- I then restarted the network service using `systemctl` restart network
	- Then I went on to install packages that were vital for vagrant to work by using `yum install -y openssh-clients nano wget ntp curl`
	- I then used this `chkconfig ntpd on && chkconfig sshd on` command to make sure when vagrant box is booted it sets the time up correctly
	- To install guest additions which is needed for file sharing in vagrant, there are some dependancies that needed to be installed
	- I installed epel repo first using `yum install epel-release`
	- I then installed dkms `yum install dkms`
	- I installed kernel headers and devel with yum 
	- I also installed gcc and make
	- I then made a directory in media/cdrom and mounted /dev/sr0/ and installed guest additions
	- I created a directory for the ssh keys to be stored for the vagrant user 	
	- After I ran the following command to allow vagrant to be able to make changes `sed -i 's/^\(Defaults.*requiretty\)/#\1/' /etc/sudoers`
	- I added the vagrant user to /etc/sudoers file using 	`echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers`
	- I then got public/private keys that were providec by vagrant using  `curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys`
	- Then I changed the permissions so that owner can read and write only using `chmod 600 /home/vagrant/.ssh/authorized_keys`
	- After that I changed ownership of the .ssh folder by using the `command chown -R vagrant:vagrant /home/vagrant/.ssh`<br />
**Create a Vagrantfile to use the image you created. Commit that file to the repo.**
- I then needed to package the vm for vagrant using `vagrant package --output centos7.box --base centos7`
- I then used `vagrant box add centos7 centos7.box`
- I then used `vagrant init centos7` to create the vagrant config file.







