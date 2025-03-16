### **1) Capture and analyze ARP packets using Wireshark. Inspect the ARP request and reply frames, and discuss the role of the sender's IP and MAC address in these packets**

## **Steps to Capture ARP Packets**
1. Open Wireshark and select your network interface
2. Apply the capture filter:
   ```
   arp
   ```
3. Start the capture
4. Generate ARP traffic by pinging an IP or clearing the ARP cache
5. Stop the capture and analyze the packets
![image](https://github.com/user-attachments/assets/a21cc381-98b3-4b13-9d92-a0524724d905)


## **Analyzing ARP Packets**
### **1. ARP Request**
- Sent to find the MAC address of an IP.
- **Sender MAC/IP:** Requesting device.
- **Target MAC:** `00:00:00:00:00:00` (unknown).
![image](https://github.com/user-attachments/assets/9d9cb45b-92d9-402e-8e89-21c295581e82)


### **2. ARP Reply**
- Sent as a response with the MAC address.
- **Sender MAC/IP:** Responding device.
- **Target MAC/IP:** Requesting device.

## **Role of Sender's IP and MAC**
- **In ARP Requests:** Sender provides its IP and MAC while querying the target IP.
- **In ARP Replies:** Sender provides its MAC for the requested IP to enable communication.

### **2) Using Packet Tracer, simulate an ARP spoofing attack. Analyze the behavior of devices on the network when they receive a malicious ARP response**

## Network Setup
1. **Devices Required:**
   - 1 Router
   - 1 Switch
   - 2 PCs (Victim & Attacker)
   - 1 Server
2. **IP Address Configuration:** Assign IP addresses to all devices.
3. **Check ARP Table:**
   ```bash
   arp -a
   ```

## Performing ARP Spoofing
1. **Send Fake ARP Responses:**
   - Modify ARP packets in **Simulation Mode**.
   - Change the router’s MAC to match the attacker’s MAC.
2. **Verify ARP Poisoning:**
   - Run `arp -a` on the victim PC to check updated ARP entries.
3. **Intercept Traffic:**
   - Use `ping <server-ip>` to see redirected traffic behavior.

## Observing Network Behavior
- The victim’s traffic is now routed through the attacker.
- Packets can be captured and analyzed for interception.

## Prevention Methods
- **Static ARP Entries:**
  ```bash
  arp -s <IP> <MAC>
  ```
- **Enable Dynamic ARP Inspection (DAI)** if using a managed switch.

### **3) Manually configure static IPs on the client devices(like Pc or your mobile phone) and verify connectivity using ping**

## Configure Static IP on Windows PC

### Step 1: Open Network Settings
1. Press `Win + R`, type `ncpa.cpl`, and press `Enter`
2. Right-click on the active network adapter (**Wi-Fi** or **Ethernet**) → Select Properties

### Step 2: Set a Static IP
1. Select **Internet Protocol Version 4 (TCP/IPv4)** → Click **Properties**
2. Choose **Use the following IP address** and enter:
   - **IP Address**: `192.168.1.100`
   - **Subnet Mask**: `255.255.255.0`
   - **Default Gateway**: `192.168.1.1`
   - **Preferred DNS Server**: `8.8.8.8`
   - **Alternate DNS Server**: `8.8.4.4`
3. Click **OK** and close

### Step 3: Verify IP Configuration
```sh
ipconfig /all
```

## Verify Connectivity Using Ping

### Ping the Router
```sh
ping 192.168.1.1
```

### Ping Another Device (Example: `192.168.1.101`)
```sh
ping 192.168.1.101
```

- **Success**: Replies received.
- **Failure**: Check cables, Wi-Fi settings, or firewall rules.


### **4) Use Wireshark to capture DHCP Discover, Offer, Request, and Acknowledge messages and explain the process**

## Capture DHCP Messages Using Wireshark

### Step 1: Start Wireshark and Select an Interface
1. Open **Wireshark**.
2. Select the **network interface** (Wi-Fi or Ethernet) your PC is using.
3. In the **Capture Filter**, enter:
   ```
   udp port 67 or udp port 68
   ```
   (This filters **DHCP traffic** only.)
4. Click **Start Capture**

### Step 2: Renew Your IP Address
To generate **DHCP packets**, open **Command Prompt** and type:
```sh
ipconfig /release
ipconfig /renew
```
This forces the PC to request a new IP from the DHCP server.

### Step 3: Stop and Analyze Packets
1. Stop Wireshark after capturing packets.
2. In the **Filter** bar, type:
   ```
   bootp
   ```
   (DHCP is based on **BOOTP protocol**).
3. Look for these **DHCP messages** in order:
   - **DHCP Discover** (Client → Broadcast: "Looking for a DHCP server")
   - **DHCP Offer** (Server → Client: "Here’s an available IP")
   - **DHCP Request** (Client → Server: "I accept this IP")
   - **DHCP Acknowledge** (Server → Client: "IP assigned successfully")


## Explanation of DHCP Process

### Step 1: DHCP Discover
- The client sends a **broadcast** request to find a DHCP server.
- **Wireshark Label**: `"DHCP Discover"`
- **Destination IP**: `255.255.255.255` (Broadcast)

### Step 2: DHCP Offer
- The DHCP server replies with an available IP.
- **Wireshark Label**: `"DHCP Offer"`
- **Includes**: Offered **IP address**, **Subnet Mask**, **Lease Time**, **Gateway**

### Step 3: DHCP Request
- The client selects an IP and requests it from the server.
- **Wireshark Label**: `"DHCP Request"`
- **Confirms** the selected IP.

### Step 4: DHCP Acknowledge (ACK)
- The server confirms the lease and assigns the IP.
- **Wireshark Label**: `"DHCP ACK"`
- The client can now communicate on the network.

### **5) Given an IP address range of 192.168.1.0/24, divide the network into 4 subnets**
## Subnetting 192.168.1.0/24 into 4 Subnets

Given the IP address range **192.168.1.0/24**, we divide it into **4 subnets** using a **/26 subnet mask**.

### **Subnet Breakdown**
| Subnet | Network Address  | First Usable IP  | Last Usable IP  | Broadcast Address |
|--------|-----------------|------------------|-----------------|-------------------|
| **1**  | 192.168.1.0/26  | 192.168.1.1      | 192.168.1.62    | 192.168.1.63     |
| **2**  | 192.168.1.64/26 | 192.168.1.65     | 192.168.1.126   | 192.168.1.127    |
| **3**  | 192.168.1.128/26 | 192.168.1.129   | 192.168.1.190   | 192.168.1.191    |
| **4**  | 192.168.1.192/26 | 192.168.1.193   | 192.168.1.254   | 192.168.1.255    |

### **Explanation**
- **Original Network:** `192.168.1.0/24` (256 total IPs)
- **New Subnet Mask:** `/26` (64 IPs per subnet)
- **Each Subnet Range:** `64` addresses (62 usable + network + broadcast)

This segmentation allows **4 separate networks** with **62 usable hosts** in each.

### **6) You are given three IP addresses: 10.1.1.1, 172.16.5.10, and 192.168.1.5**
  - **Task: Identify the class of each IP address (Class A, B, or C). What is the default subnet mask for each class?**
  - **Provide the range of IP addresses for each class**
## Identifying IP Address Classes and Default Subnet Masks

### **Given IP Addresses**
| IP Address     | Class | Default Subnet Mask | Class Range           |
|---------------|------|-------------------|----------------------|
| **10.1.1.1**   | A    | 255.0.0.0         | 1.0.0.0 - 126.255.255.255 |
| **172.16.5.10** | B    | 255.255.0.0       | 128.0.0.0 - 191.255.255.255 |
| **192.168.1.5** | C    | 255.255.255.0     | 192.0.0.0 - 223.255.255.255 |

### **Explanation**
- **Class A:** First octet `1-126`, default subnet mask `255.0.0.0`
- **Class B:** First octet `128-191`, default subnet mask `255.255.0.0`
- **Class C:** First octet `192-223`, default subnet mask `255.255.255.0`

These IPs belong to **private IP ranges** commonly used in local networks.

### **7) In Cisco Packet Tracer, create a small network with multiple devices (e.g., 2 PCs and a router). Use private IP addresses (e.g., 192.168.1.x) on the PCs and configure the router to perform NAT to allow the PCs to access the internet**
  - **Task: Test the NAT configuration by pinging an external IP address from the PCs and capture the traffic using Wireshark**
  - **What is the source IP address before and after NAT**

## Configuring NAT in Cisco Packet Tracer

### **Network Setup**
- **Devices:** 2 PCs, 1 Router  
- **PCs Private IPs:** 192.168.1.2, 192.168.1.3 (Subnet: 255.255.255.0, Gateway: 192.168.1.1)  
- **Router:** NAT enabled with an external IP (e.g., 203.0.113.1)  

### **Testing NAT**
1. **Ping an External IP** (e.g., 8.8.8.8) from a PC.
2. **Capture Traffic** using **Wireshark** on the router’s external interface.

### **Source IP Before and After NAT**
- **Before NAT (PCs → Router):** `192.168.1.2` or `192.168.1.3`  
- **After NAT (Router → Internet):** `203.0.113.1` (Public IP assigned to the router)

### **Conclusion**
NAT translates private IPs to a public IP, enabling internet access.

