#!/bin/sh
#1
awk -F: '{print "user", $1, "has id", $3}' /etc/passwd >> work3.log
#2
sudo passwd -S root >> work3.log  
#3
awk -F: '{print $1}' ORS="," /etc/group >> work3.log
#4
echo 'Be careful!' >> /etc/skel/readme.txt
#5
useradd u1 -p $(openssl passwd -crypt 12345678)
#6
groupadd g1
#7
usermod -a -G g1 u1
#8
id u1 >> work3.log
#9
usermod -a -G g1 user
#10
grep g1 /etc/group | awk -F: '{print $4}' >> work3.log
#11
usermod -s /usr/bin/mc u1
#12
useradd u2 -p $(openssl passwd -crypt 87654321)
#13
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log
#14
sudo usermod -aG g1 u1
chown -R u1:g1 /home/test13
sudo chmod u=rwx,g=rx,o= /home/test13
sudo chmod u=rw,g=r,o= /home/test13/work3-{1,2}.log
#15
sudo usermod -aG g1 u1
chown -R u1:g1 /home/test13
sudo chmod u=rwx,g=rx,o= /home/test13
sudo chmod u=rw,g=r,o= /home/test13/work3-{1,2}.log
#16
cp /bin/nano /home/test14/nano
chown u1 /home/test14/nano
chmod u+s /home/test15/nano
#17
mkdir /home/test15
touch /home/test15/secret_file
chmod 111 /home/test15
chmod 444 /home/test15/secret_file
