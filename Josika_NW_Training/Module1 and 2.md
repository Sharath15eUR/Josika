### **1) Consider a case, a folder has multiple files and how would copy it to destination machine path (Try using SCP, cp options in Linux)**

#### **i) Copying a folder to a remote machine using SCP** 
The SCP (Secure Copy Protocol) command is used to securely transfer files and directories between machines over SSH

##### **Command :**
```bash
scp -r "C:\Users\admin\Downloads\demo" 21bcs010@172.16.16.200:~
```
* -r : Recursively copy all files and subdirectories
* "C:\Users\admin\Downloads\demo" : Source folder to be copied
* 21bcs010@172.16.16.200:~ : Destination machine with username and IP address
  
##### **Execution :**
![1](https://github.com/user-attachments/assets/e8a789e4-5185-4aac-8342-c6d29b333663)


#### **ii) Copying a Folder Locally Using cp**
The cp command is used to copy files and directories within the local system.

##### **Command :**
```bash
cp -r 1yr/sem1/c eUR/clg
```
* -r : Recursively copy directories
* 1yr/sem1/c : Source directory
* eUR/clg : Destination directory
  
##### **Execution :**
![2](https://github.com/user-attachments/assets/88c8d38b-ac26-4275-9bab-c7773174a4d8)

### **2)Host a FTP and SFTP server and try PUT and GET operations**
i)Installing and Starting FTP Server
```bash
sudo apt update && sudo apt install vsftpd -y
sudo systemctl start vsftpd && sudo systemctl enable vsftpd
sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo systemctl restart vsftpd
```
ii)SFTP (via SSH)
```bash
sudo systemctl start ssh
```
iii) Connecting to Server
FTP Login
```bash
ftp 172.16.16.200
```
SFTP Login
```bash
sftp 21bcs010@172.16.16.200
```
iv) PUT and GET commands
#### Uploads test.txt from local machine to the remote server and downloads sample.txt from the remote server to your local machine 
```bash
put C:/Users/admin/Downloads/test.txt
get sample.txt
```

### **3)Explore with Wireshark/TCP-dump/cisco packet tracer tools and learn about packets filters**
Wireshark is a GUI used to capture,filter and analyze network packets

#### **i) Capturing only ICMP packets**
```bash
icmp
```
![3](https://github.com/user-attachments/assets/4c04c008-4092-491f-a861-928ef18218e8)


#### **ii) Capturing only HTTP and DNS traffic**
```bash
tcp.port == 80||udp.port == 53
```
![4](https://github.com/user-attachments/assets/060957b2-3f2b-43f9-a6af-ee2de91ea470)

#### **iii) Displaying packets of a specific IP** 
```bash
ip.addr == 172.16.3.40
```
![5](https://github.com/user-attachments/assets/791244c3-1339-4146-9dd5-e9ea0f510f67)


### **4)Understand linux utility commands like - ping, arp (Understand each params from ifconfig output)**
#### **i) ping - Check Network Connectivity**
##### **Command :**
```bash
ping -c 4 8.8.8.8
```
Sends 4 packets to Google to check if it's reachable 
##### **Execution :**
![6](https://github.com/user-attachments/assets/b9c3aac1-3190-48f4-aa2e-eac2e806d94f)


#### **ii) arp** 
Address Resolution Protocol Table maps IP addresses to MAC addresses

##### **Command :**
```bash
arp -a
```

##### **Execution :**
![7](https://github.com/user-attachments/assets/6ddb213b-e82d-4b96-80dd-941d52e91238)


#### **iii) ifconfig - Display Network Interfaces**

##### **Command :**
```bash
ip a
```  
##### **Execution :**
![8](https://github.com/user-attachments/assets/bc448895-7289-4365-bb89-ece0092025bb)


### **5)Understand what happens when duplicate IPs configured in a network**

Duplicate IPs cause ARP conflicts, packet loss, intermittent connectivity issues and network instability

#### **Causes :**
* Manual IP Conflict: Two devices have same static IP
* DHCP Conflict: A DHCP server assigns an already-in-use IP
* MAC Cloning: Identical MAC addresses lead to conflicts

#### **Effects :**
* Misrouted Packets – ARP tables keep updating incorrectly
* Packet Loss & Connectivity Issues – Devices may randomly disconnect
* Flapping – Devices alternate between working and disconnecting

#### **Detection Commands :**
```bash
arp -a              # Check conflicting MACs  
ping <IP>           # Intermittent responses indicate issues  
sudo tcpdump -i eth0 arp  # Watch ARP conflicts  
nmap -sn 192.168.1.0/24   # Scan for duplicate IPs  
```
#### **Fixes :**

#### i) For static IP Conflict
Restart networking if a static IP conflict occurs
```bash
sudo systemctl restart networking
```

#### ii) For DHCP Conflicts
Release & renew IP if DHCP assigns duplicates
```bash
sudo dhclient -r && sudo dhclient
```

#### iii) For MAC Address Cloning Issues
Change MAC address if cloning causes conflicts
```bash
sudo ifconfig eth0 hw ether <new_mac>
```

### **6)Understand how to access remote system using (VNC viewer, Anydesk, teamviewer and remote desktop connections)**

System can be accessed remotely using tools like AnyDesk, TeamViewer inorder to troubleshoot issues, transfer files or manage a system from anywhere

#### **AnyDesk :**
* Ensure both the user’s computer and the remote device have AnyDesk installed. If not, download and install it
* On the remote computer, locate the unique AnyDesk ID displayed on the screen
* On the user’s computer, enter this AnyDesk ID in the Remote Desk field and click Connect
* The remote user will receive a request to allow access
* Once they click Accept, the user can control the remote system

#### **TeamViewer :**
* Ensure both the user’s computer and the remote device have TeamViewer installed. If not, download and install it
* Open TeamViewer on the remote computer and locate the Partner ID displayed on the screen
* On the user’s device, enter this Partner ID and click Connect
* Unlike AnyDesk, TeamViewer requires a password for authentication
* The remote user needs to share the password displayed on their screen
* The user will gain access on entering correct password and can control the remote system

### **7)How to check your default gateway is reachable or not and understand about default gateway**
* A **default gateway** is the router that forwards traffic from your local network to external networks
* It is listed as `default via <IP>` in the routing table

##### **Command :** 
i) Find Default Gateway:
```bash
ip route | grep default
```
ii) Ping the Gateway:
```bash
ping <gateway-IP>
```

##### **Execution :**
![9](https://github.com/user-attachments/assets/5c8b09fc-eef4-4455-a750-a59659c66b00)

### **8)Check iwconfig/ifconfig to understand in detail about network interfaces (check about interface speed, MTU and other parameters)**

#### **i)iwconfig**
iwconfig is used to check and configure wireless network interfaces

##### **Command :**
```bash
iwconfig
```

#### **ii)ifconfig**

##### **Command :** 
#### i) ifconfig displays network interface details
```bash
ifconfig
```
#### ii) For specific interface details
```bash
ifconfig eth0
```
#### iii)Changing MTU of eth0 to 1400 bytes
```bash
ifconfig eth0 mtu 1400
```
#### iv)To know the speed of interface
```bash
ethtool eth0
```


### **9)Log in to your home router’s web interface (usually at 192.168.1.1 or 192.168.0.1) and check the connected devices list**
#### **Steps involved :** 
* Find Router's IP Address
* Open a web browser and enter the Default Gateway (usually 192.168.1.1 or 192.168.0.1)
* In the Login page enter the Router's username and password
* Look for Connected Devices, DHCP Client List, LAN Status which show all devices connected via Wi-Fi and Ethernet, along with their IP and MAC addresses

#### **Execution :**
![10](https://github.com/user-attachments/assets/f84b03df-097c-4829-ac08-0ee4c1eca1ed)
![11](https://github.com/user-attachments/assets/16eda74b-0d05-4d04-ab84-1ed0a39234cd)


### **10)Explain how a DHCP server assigns IP addresses to devices in your network**
A DHCP (Dynamic Host Configuration Protocol) Server dynamically assigns IP addresses to devices in a network, ensuring efficient and automated IP management

#### **Steps involved are:**
* DHCP Discovery – The client broadcasts a request to locate a DHCP server
* DHCP Offer – The server responds with an available IP address and configuration details
* DHCP Request – The client selects and requests the offered IP from the server
* DHCP Acknowledgment – The server confirms the assignment, allowing the client to use the IP
  
The assigned IP address is leased for a specific period. Before expiration, the client attempts to renew the lease to maintain uninterrupted connectivity

### **11)Using a terminal, connect to a remote machine via SSH and telnet**

#### **i) Connecting via SSH :**
SSH (Secure Shell) connects securely to a remote machine using encryption, typically on port 22

##### **Command :**
```bash
ssh <username>@<IP_Address>
```
##### **Execution :**
![12](https://github.com/user-attachments/assets/098769a8-03e5-40f7-8a53-3feb76be408d)

#### **ii) Connecting via Telnet :**
Telnet is an unencrypted protocol used for remote access, typically over port 23. It is less secure and not recommended for sensitive operations

##### **Command :**
```bash
telnet <IP_Address> <Port>
```
Use SSH for secure remote access, as Telnet sends data in plaintext and is vulnerable to attacks
