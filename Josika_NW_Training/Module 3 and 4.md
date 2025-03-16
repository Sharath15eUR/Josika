### **1) Simulate a small network with switches and multiple devices. Use ping to generate traffic and observe the MAC address table of the switch. Capture packets using Wireshark to analyze Ethernet frames and MAC addressing**
Step 1 : Set Up the Network Topology
- Drag and drop the following devices onto the workspace:
  - 1 Switch (e.g., 2960-24TT)
  - 3 PCs (End devices)
- Connect the Devices
- Use Copper Straight-Through cables to connect:
  - PC0 → Switch (FastEthernet 0/1)
  - PC1 → Switch (FastEthernet 0/2)
  - PC2 → Switch (FastEthernet 0/3)
![image](https://github.com/user-attachments/assets/f7d25ad9-7eb8-4734-a3da-fa326c5c0d73)


Step 2 : Configure IP Addresses on PCs
Click on PC0, go to Desktop → IP Configuration, and assign:
```` bash
IP Address: 192.168.1.1
Subnet Mask: 255.255.255.0
````
Repeat for PC1 with:
```` bash
IP Address: 192.168.1.2
Subnet Mask: 255.255.255.0
````
![image](https://github.com/user-attachments/assets/6974ed39-7c9f-47f7-981e-b5916db60e1c)
![image](https://github.com/user-attachments/assets/884b3c98-f870-4b1c-ad43-c890444004af)

Repeat for PC2 with:
````bash
IP Address: 192.168.1.3
Subnet Mask: 255.255.255.0
````

Step 3 : Generate Traffic Using Ping
1. Open PC0’s Command Prompt (Desktop → Command Prompt)
   ```` bash
   ping 192.168.1.2
   ping 192.168.1.3
   ````
   This will generate traffic between PC0 and PC1 , PC0 and PC2
![image](https://github.com/user-attachments/assets/5a259df4-e848-4b5b-96c6-2b6676fec62d)
   
Step 4 : Observe the MAC Address Table of the Switch

Click on the Switch, go to the CLI (Command Line Interface).
Enter the following command:
```bash
enable
show mac address-table
```
This will display the MAC addresses of the connected devices.
![image](https://github.com/user-attachments/assets/f9dcaf7e-42e8-470c-afac-8541f6a1291e)


Step 5: Capture and Analyze Packets Using Simulation Mode
- At the bottom-right corner, click on Simulation Mode
- Click on Edit Filters and select ICMP & ARP to focus on ping requests
- Click Play to start capturing packets
- Click on a packet to inspect its details, including:
  - Source and Destination MAC Addresses
  - Ethertype (Identifies the protocol)
  - Payload (ICMP Request & Reply)
![image](https://github.com/user-attachments/assets/6f5cb9df-ca34-44b8-af0c-6701990d29c1)
![image](https://github.com/user-attachments/assets/d65a90e4-dbb0-49e8-8520-4c775c58f73a)

### **2) Capture and analyze Ethernet frames using Wireshark. Inspect the structure of the frame, including destination and source MAC addresses, Ethertype, payload, and FCS. Use GNS3 or Packet Tracer to simulate network traffic**
#### 2.1) Steps to Capture and Analyze Ethernet Frames Using Wireshark
- Start Wireshark
- Start Packet Capture
- Generate Network Traffic
  - Open a Command Prompt (Windows)
  - Run the ping command to generate traffic (creates ICMP packets, which travel over Ethernet)
![image](https://github.com/user-attachments/assets/f8b7f781-a518-44e4-8abc-927448c869d3)
- Filter Captured Packets
![image](https://github.com/user-attachments/assets/201f561c-1672-4f73-9af8-e3c7f896c8b1)
- Analyze an Ethernet Frame
  - Click on a captured ICMP packet
      - Expand the Ethernet II section to inspect:
         - Destination MAC Address
         - Source MAC Address
         - Ethertype (IPv4: 0x0800, ARP: 0x0806)
         - Payload (ICMP/ARP request data)
         - FCS (Frame Check Sequence) for error detection
 ![image](https://github.com/user-attachments/assets/644bea0c-ad6a-4fa2-ad5d-01c6d9324ce8)
 
#### 2.2) Using Packet Tracer
- Set up a network in Packet Tracer (PCs & switch)
  ![image](https://github.com/user-attachments/assets/41c4d833-3311-49d1-a217-7347580b6c63)
- Enable ARP & ICMP filters in Simulation Mode
- Ping another PC to generate traffic
  ![image](https://github.com/user-attachments/assets/41216eb6-88d7-4f1a-90c2-ecc7efe688d9)
- Inspect captured packets → Inbound PDU Details to view:
  - Source & Destination MAC Addresses
  - Ethertype (IPv4: 0x0800, ARP: 0x0806)
  - Payload (ICMP/ARP data)
  - FCS
![image](https://github.com/user-attachments/assets/b59f1311-fe12-48e2-86c5-234e72778d58)
![image](https://github.com/user-attachments/assets/2e5e9f7d-6f39-4070-934d-d9ee3edde7f0)
### **3) Configure static IP addresses, modify MAC addresses, and verify network connectivity using ping and ifconfig commands**
  - 1) Set a Static IP Address:
```bash
sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0 up
```
  - 2) Change MAC Address:
```bash
sudo ifconfig eth0 down  
sudo ifconfig eth0 hw ether 00:11:22:33:44:55  
sudo ifconfig eth0 up
```
  - 3) Verify Changes:
```bash
ifconfig eth0
```
  - 4) Check Network Connectivity:
```bash
ping 192.168.1.1
```
### **4) Troubleshoot Ethernet Communication with ping and traceroute  -> Using cisco packet tracer**
  - Open Cisco Packet Tracer
  - Create a Network Topology ( 1 Switch and 2 PCs )
  ![image](https://github.com/user-attachments/assets/b04edaeb-a11e-465a-873c-60a9a7997196)
  - Assign IP Addresses
     - 1.	Click on PC0 → Go to Desktop → Open IP Configuration
          o	IP Address: 192.168.1.1
         	o	Subnet Mask: 255.255.255.0
     - 2. Click on PC1 → Go to Desktop → Open IP Configuration
          o	IP Address: 192.168.1.2
          o	Subnet Mask: 255.255.255.0
  - Test Connectivity with ping
  ![image](https://github.com/user-attachments/assets/64b22ba5-2206-413b-89fe-47f905fdbc57)

  - Use traceroute to Identify Issues
![image](https://github.com/user-attachments/assets/418e40bf-d738-4c44-a9bd-031aec2b780f)
This shows the path the packet takes

### **5) Create a simple LAN setup with two Linux machines connected via a switch**
Setting up a simple LAN in Packet Tracer with two Linux PCs connected via a switch
![image](https://github.com/user-attachments/assets/3889ca6e-0556-475b-ab67-8165e44edc97)

  - Configured static IPs (192.168.1.10 & 192.168.1.20)
   ![image](https://github.com/user-attachments/assets/1717257e-035b-4b0c-95b2-ce52fe842d59)
   ![image](https://github.com/user-attachments/assets/b4de5745-27fa-4ce3-b8c4-f6ffa4608fd7)
  - Verified connectivity using ping
    ![image](https://github.com/user-attachments/assets/66d6c13b-3a6f-4033-9929-dbf4bd55f421)
  - Result: Successful LAN communication
### **6) Ping from one machine to the other. If it fails, use ifconfig to ensure the IP addresses are configured correctly**
  - i) Ping the Other Machine:
      - On PC0, run :
    ```bash
    ping 192.168.1.20
    ```
      - If ping fails, proceed to check network settings
  - ii) Verify IP Configuration:
      - Check if the IP addresses are set correctly on both machines:
    ```bash
    ping 192.168.1.20
    ```
      - Ensure both PCs have:
        - Unique IPs (e.g., 192.168.1.10 & 192.168.1.20)
        - Same subnet mask (255.255.255.0)
  - iii) Check Network Connection:
          Ensure both PCs are properly connected to the switch using straight-through cables
  - iv) Enable Network Interface (if down):
    ```bash
    sudo ifconfig eth0 up
    ```    
  - v) Retry Ping
        If successful, the network is working
### **7) Use traceroute to identify where the packets are being dropped if the ping fails**
![image](https://github.com/user-attachments/assets/62a3eee6-0b79-426f-af2c-7063e8a91e3b)
  - Step 1: Run traceroute from PC0(192.168.1.10) to PC1(192.168.1.20):
![image](https://github.com/user-attachments/assets/818dbce1-d2b8-41ea-9118-b103c72ccbbd)
  - Step 2: Check Output:
      - If only one hop appears, the devices are directly connected
      - If * * * appears, packets are dropping at that point (Verify IP settings/check cables/ensure network interfaces are up)
### **8) Research the Linux kernel's handling of Ethernet devices and network interfaces. Write a short report on how the Linux kernel supports Ethernet communication**

The Linux kernel provides robust support for Ethernet communication by managing network interfaces, handling packet transmission, and implementing key networking protocols. The kernel interacts with Ethernet devices through a layered networking stack, ensuring efficient data transfer and connectivity.


1) Network Interface Management
   The Linux kernel recognizes Ethernet devices as network interfaces (e.g., eth0, eth1). These interfaces are controlled using kernel modules such as e1000, r8169, or other driver-specific modules that enable communication with the hardware. The ip link and ifconfig commands allow users to view and configure network interfaces.

2) Packet Transmission and Reception
   Ethernet frames are processed by the kernel’s Network Stack, which includes the following layers:
   - Device Drivers: Manage the Ethernet hardware and enable communication.
   - Network Layer: Routes packets based on IP addresses.
   - Transport Layer: Ensures reliable communication (e.g., TCP, UDP).
   The kernel uses sk_buff (socket buffers) to manage network packets, storing metadata and payloads efficiently.

3) MAC Address Handling
   Each Ethernet device has a unique MAC address, which is managed by the kernel and can be modified using:
   ```bash
   ip link set eth0 address XX:XX:XX:XX:XX:XX
   ```
   The kernel maintains a MAC address table to facilitate communication within a local network.

4) Ethernet Frame Processing
   The Linux kernel processes Ethernet frames, which consist of:
   - Source & Destination MAC Addresses
   - EtherType (identifying the protocol, e.g., IPv4, ARP)
   - Payload (data being transmitted)
   - Frame Check Sequence (FCS) for error detection.

5) Kernel Networking APIs and Modules
   The kernel includes APIs such as netdev_ops and modules like netfilter for packet filtering and forwarding. The bridge module (brctl or ip link add br0) enables Layer 2 networking for bridging connections.

### **9) Describe how you would configure a basic LAN interface using the ip command in Linux  **
## Steps to Configure a LAN Interface

### 1. Check Existing Network Interfaces
```bash
ip addr show
```
This command lists all available network interfaces and their current configurations

### 2. Assign an IP Address
```bash
sudo ip addr add 192.168.1.100/24 dev eth0
```
This assigns the IP address `192.168.1.100` with a subnet mask of `255.255.255.0` (`/24`) to the `eth0` interface

### 3. Bring the Interface Up
```bash
sudo ip link set eth0 up
```
This activates the `eth0` interface

### 4. Set the Default Gateway
```bash
sudo ip route add default via 192.168.1.1
```
This configures the default gateway as `192.168.1.1`

### 5. Verify Configuration
```bash
ip addr show eth0
ip route show
```
These commands check the assigned IP address and routing table to confirm the configuration

### **10) Use Linux to view the MAC address table of a switch (if using a Linux-based network switch). Use the bridge or ip link commands to inspect the MAC table and demonstrate a basic switch's operation**
1) Using the bridge command:
   ```bash
   bridge fdb show
   ```
2) Using the ip link command:
   ```bash
   ip link show
   ```
  
    
