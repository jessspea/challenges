<h1>Challenges</h1>
**Challange 1**<
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

**Challange 2**
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
	- I then got public keys that were provide by vagrant using  `curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys`
	- Then I changed the permissions so that owner can read and write only using `chmod 600 /home/vagrant/.ssh/authorized_keys`
	- After that I changed ownership of the .ssh folder by using the `command chown -R vagrant:vagrant /home/vagrant/.ssh`<br />

**Create a Vagrantfile to use the image you created. Commit that file to the repo.**
- I then needed to package the vm for vagrant using `vagrant package --output centos7.box --base centos7`
- I then used `vagrant box add centos7 centos7.box`
- I then used `vagrant init centos7` to create the vagrant config file.<br />

**Challenge 3**<br />
**Challenge 3.1 (extra)**<br />
- Look up packer<br />
	- Installed Packer
	- set `PATH=$PATH:"path where packer is saved"` so we can run packer when we start terminal
	- Create json script
	- Create a KS configfile-<br />

- Create a centos 7 base box with packer and commit the packer JSON config file
	-Then use `packer build centos7packer.json` This will download and varify the iso and spin up the virtual box-<br />

1. Create a user with username and a password of your choice.<br />
	- `useradd username` `passwd username` then type password. Password can be changed by this command but must be root user when changing.
2. Logout and login as that user.<br />
	-`su username` `su -` You can check by using the command `whoami`
3. Open a terminal and start rocking!<br />
4. learn what the man command does.<br />
	-man can be used to show manual pages 
5. start learning commands is good to follow one of the many Linux/Unix command line tutorials out there and
  practice. You should be able to answer these questions:<br />
6. Navigating in the file system<br />
	- `pwd` This shows the current directory you are in
	- `cd` This changes directory
	- `ls` Lists the current files in the current location. Using `ls -a` will show hidden directories. `ls -l` will give us more info on each file
	- one dot . refers to current directory
	- two dots .. refer to the previous directory
7. Creating files ( you need to learn to use one of the many terminal editors. Is personal preference!)<br />
	- `touch filename` to create file 
	- using `cat > test.txt` will create the test txt file and you can add text here. Use ctr d to close the file. This command can also be used cat test.txt to view contents of the file.
8. Deleting files<br />
	- `rm filename` to remove file. This won't ask if your sure
9. Editing files<br />
	- To add text use vi filename and this will bring up the vim file. You can move the cursor and use x to delete. Use I to insert. To save and quit hit esc and the :wq. You can use :w to just save and carry on or :q! to quit without saving. 
10. Search inside files for a pattern<br />
	- We can use `grep` to find patterns. This is case sensitive. `grep -i` can be used to ignore case. `grep -r` will go through a directory and recursively check for a pattern
11. Creating directories<br />
	- `mkdir` to create new directory
12. Removing directories<br />
	- `rmdir directory` if there are no files or other directories in that directory. We can use rm -`r directory` to remove the directory but this will also delete all file and folders in that location
13. What processes are ? How to list them all ? How to kill some ?<br />
14. Learn what Input & Output is.<br />
15. Learn redirection<br />







