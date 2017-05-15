<h1>Challenges</h1>

**Challange 1**<br />
**Install any linux distribution using vagrant**<br />
*Bonus if you install Centos 7 because we use that.*
- Installed Vagrant
- Installed Virtual Box
- Made a vagrant root directory and called this vagrant_test
- CD into that directory and made vagrant configuration file
	- Used `vagrant init centos/7`
- Added the centos7 box with `vagrant box add centos/7`
	- Selected option 2 for using with virtual box
- Next I booted up the environment by using `vagrant up`
- We can then ssh into the machine using `vagrant ssh`
<br />
**Challange 2**<br />
**Create a git repository in Github with a single *MARKDOWN* file called log.md to quickly present your steps for every challenge.**
- Created a github account
- Created a git repo and called this challenges
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
- Look up packer
- Create a centos 7 base box with packer and commit the packer JSON config file
	- Installed Packer
	- set `PATH=$PATH:"path where packer is saved"` so we can run packer when we start terminal or edit the .bash_profile and add the directory in there.
	- Created a json script
	- Created a KS configfile<br />
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
	-Processes are used to carry out tasks. A process is an instance of a program running in Linux. These can be listed by using the command `ps -aux` a to select all prcesses. u to show all processes of all users. x is to select processes without controlling ttys. We can also use `top` to see all processes runing on the server. Each process has a pid to get this we can use `pgrep`. We can kill processees by getting the pid and `kill` with the pid. This will send a TERM signal to the process to terminate it. If you want to kill via process name we can use `pkill`
14. Learn what Input & Output is.<br />
	- Input and Output are distributed through 3 streams, stdin(0), stdout(1), stderr(2). Standared Input carries data from a user to a program. This usually comes from a device e.g keyboard. stdin is terminated by EOF which indicates there is no more date to be read. Standared output is data generated by a program. When this data is not redirected it will output text on the terminal. We can use Echo to show the output data. Standard error writes the erros that are generated by a program and displays this on the terminal.
15. Learn redirection<br />
	- We can use `>` to redirect stdout to a file and `<` to redirect input to a file.  `2>` is used for sending error output to a file. This will be overwritten everytime we use this command. We can use `>>` to append to the file or `<<` for input and `2>>`. We can use pipes | to feed standard output of one command to standard input of another.

**Challenge 4** <br />
Deploy a ruby application in heroku using terraform. The application can be just a simple hello world application. Please commit your terraform configuration
but don't commit any user credentials in the public github repository.Look up what heroku is and what terraform is. Heroku has a free tier and you can use that.
Let us know a URL that we can visit and see a Hello world message.
- Download and install postgres and intall all bundles
- Download all ruby packages
- I went through the getting started guide before starting the hello world app.
- I used `heroku login` to login in terminal
- I used `rails new helloworld database=postgresql` to create new ruby app and cd into that directory
- Then I used `bundle install` to reinstall dependencies
- I then gererated a root page using `rails generate controller welcome`
- I then edited the index.html.erb to add in the Hello World script
- I then edited the routes.rb to set the index page to this using  `root welcome#index`
- I used bundle exec rake db:create to create the database
- Initialise to use git `git init`
- Then I used `git add .` and `git commit-m "helloworld"
- use `heroku create`
- git push to heroku using `git push heroku master`
- Then I needed to initialise the database using `heroku run rake db:reset`
- Then I needed to migrate the db using `heroku run rake db:migrate` and `heroku open`
- Without a database the app would not load on Heroku
- I downloaded terraform and added this to terminal root.
- I then went on to create an app via terraform, please see app.tf for config file.
- I got an error when I used terraform apply as heroku didn't allow the db to be added due to having a free account.

**Challenge 5** <br />
Modify the base box you created to use puppet provisioner. Then use puppet to configure the file /etc/motd with a custom message.
I would expect to do
$vagrant up
$vagrant ssh
InsideVM $ cat /etc/motd
CUSTOM MESSAGE ....
- I added a puppet folder to my vagrant directory and then added a manifests folder with a init.pp file
- I modified the init.pp folder to declare the file resource
- I then added the install of puppet to the Vagrant file
- I modified the Vagrant file to use puppet provisioner
- I was able to ssh into the machine and see the motd custom message
- Updated
