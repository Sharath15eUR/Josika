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
### **3)Configure static IP addresses, modify MAC addresses, and verify network connectivity using ping and ifconfig commands**
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

### **5)Create a simple LAN setup with two Linux machines connected via a switch**
Setting up a simple LAN in Packet Tracer with two Linux PCs connected via a switch
![image](https://github.com/user-attachments/assets/3889ca6e-0556-475b-ab67-8165e44edc97)

  - Configured static IPs (192.168.1.10 & 192.168.1.20)
   ![image](https://github.com/user-attachments/assets/1717257e-035b-4b0c-95b2-ce52fe842d59)
   ![image](https://github.com/user-attachments/assets/b4de5745-27fa-4ce3-b8c4-f6ffa4608fd7)
  - Verified connectivity using ping
    ![image](https://github.com/user-attachments/assets/66d6c13b-3a6f-4033-9929-dbf4bd55f421)
  - Result: Successful LAN communication

