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

