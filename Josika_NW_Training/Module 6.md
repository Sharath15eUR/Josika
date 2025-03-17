### **1) Capture and analyze ARP packets using Wireshark. Inspect the ARP request and reply frames when your device attempts to find the router’s MAC address.Discuss the importance of ARP in packet forwarding**

1) Open Wireshark → Select your Wi-Fi/Ethernet interface
2️) Apply ARP Filter → Type arp in the filter bar and press Enter
3) Generate ARP Traffic:
  - Open Command Prompt/Terminal
  - Clear ARP cache:
      - Windows: arp -d *
      - Linux/macOS: sudo ip -s -s neigh flush all
  - Ping router: ping 192.168.1.1
4) Analyze ARP Packets:
Request: Broadcast (FF:FF:FF:FF:FF:FF), Opcode 1 (Who has 192.168.1.1?)
Reply: Router's MAC address, Opcode 2 (192.168.1.1 is at XX:XX:XX:XX:XX:XX)
5) Stop Capture → Save for analysis.
6) Check ARP Table:
  - Windows: arp -a
  - Linux/macOS: ip neigh show

#### Importance of ARP in Packet Forwarding
The Address Resolution Protocol (ARP) is crucial for packet forwarding in IPv4 networks. It maps an IP address to a MAC address, allowing devices to communicate within a local network

### Importance of ARP in Packet Forwarding  

1. **Enables MAC Address Discovery** – Finds the MAC address of the destination device  
2. **Essential for Local Communication** – Ensures packets reach the correct physical device  
3. **Supports Routing** – Routers use ARP to forward packets to next-hop devices  
4. **Prevents Network Disruptions** – Keeps an updated ARP cache for efficient forwarding  


### **2) Manually configure static routes on a router to direct packets to different subnets.Use the ip route command and verify connectivity using ping and traceroute**
i) Check Existing Routes
```bash
ip route show
```
ii) Add a Static Route
```bash
sudo ip route add 192.168.1.0/24 via 172.16.16.10 dev enp91s0f0
```
![image](https://github.com/user-attachments/assets/1f46782c-1049-43ff-a54c-56b6944b47a0)

iii) Verify the Route
```bash
ip route show
```
iv) Test Connectivity
```bash
ping -c 4 192.168.1.1
traceroute 192.168.1.1
```



### **3) Given a network address of 10.0.0.0/24, divide it into 4 equal subnets.Calculate the new subnet mask.Determine the valid host range for each subnet.Assign IP addresses to devices in Packet Tracer and verify connectivity**

#### **Dividing 10.0.0.0/24 into 4 Equal Subnets**  

#### **Step 1: Calculate New Subnet Mask**  
- `/24` has **256** addresses (2 pow 8)
- Dividing into **4 subnets** → **Each subnet gets 64 addresses** (2 pow 6)
- **New subnet mask**: **/26** (255.255.255.192)

#### **Step 2: Determine Subnets & Host Ranges**  

| **Subnet**   | **Network Address** | **First Host**  | **Last Host**   | **Broadcast**  |
|-------------|------------------|---------------|---------------|-------------|
| **Subnet 1** | 10.0.0.0/26      | 10.0.0.1      | 10.0.0.62     | 10.0.0.63   |
| **Subnet 2** | 10.0.0.64/26     | 10.0.0.65     | 10.0.0.126    | 10.0.0.127  |
| **Subnet 3** | 10.0.0.128/26    | 10.0.0.129    | 10.0.0.190    | 10.0.0.191  |
| **Subnet 4** | 10.0.0.192/26    | 10.0.0.193    | 10.0.0.254    | 10.0.0.255  |
 
- **New Subnet Mask**: **/26 (255.255.255.192)**  
- **Each subnet has 62 usable hosts**

#### **Assigning IP addresses to devices in Packet Tracer to verify connectivity** 
### **Steps to Assign IP Addresses & Verify Connectivity in Packet Tracer**  

1. **Open Packet Tracer** and add **2 PCs and 1 Switch** 
2. **Connect PCs to the Switch** using **Copper Straight-Through** cables
![image](https://github.com/user-attachments/assets/1763c7ce-86b3-4f44-8518-af8afba1aeff)

3. **Assign IP Addresses**:  
   - **PC0**: `192.168.1.2 / 255.255.255.0`  
   - **PC1**: `192.168.1.3 / 255.255.255.0`
![image](https://github.com/user-attachments/assets/8e4c136a-a4a5-49ff-a3aa-9c2fd99bd3d1)
![image](https://github.com/user-attachments/assets/be8af12c-df35-4af8-98cc-d4c122b241d9)

5. **Verify Connectivity**:  
   - Open **Command Prompt** on **PC0** and type:  
     ```bash
     ping 192.168.1.3
     ```
     ![image](https://github.com/user-attachments/assets/970e16ba-0189-4e36-8987-6ae0a4ac3539)

### **4) You are given three IP addresses: 192.168.10.5, 172.20.15.1, and 8.8.8.8. Identify the class of each IP address.Determine if it is private or public.Explain how NAT would handle a private IP when accessing the internet**





### **5) In Cisco Packet Tracer, configure NAT on a router to allow internal devices (192.168.1.x) to access the internet.Test connectivity by pinging an external public IP.Capture the traffic in Wireshark and analyze the source IP before and after NAT translation**
