### **1. Brief about SplitMAC architecture and how it improves the AP's performance**

#### SplitMAC Architecture
**SplitMAC** divides the MAC (Media Access Control) layer functions between the **Access Point (AP)** and a **Wireless LAN Controller (WLC)**:
- **AP** handles real-time functions (e.g., acknowledgements, encryption)
- **WLC** handles management tasks (e.g., authentication, roaming, QoS)

#### How It Improves AP Performance
- **Reduces load on the AP** by offloading complex tasks to the WLC
- **Centralized management** of multiple APs through the WLC
- **Improves roaming performance** for users moving between APs
- **Enhances scalability** and simplifies network updates and security

### **2. Describe about CAPWAP , explain the flow between AP and Controller**
CAPWAP is a protocol that allows a **Wireless LAN Controller (WLC)** to manage **Access Points (APs)** centrally

####  AP–Controller Flow 
1. **AP boots up** and finds the WLC
2. **Discovery**: AP sends request, WLC responds
3. **Join**: AP requests to join, WLC accepts
4. **Configuration**: WLC sends settings (SSID, channels, etc)
5. **Tunnels**:
   - **Control tunnel** (UDP 5246) → config & management  
   - **Data tunnel** (UDP 5247) → client traffic (optional)
6. **AP goes live**, managed by the controller

### **3. Where this CAPWAP fits in OSI model , what are the two tunnels in CAPWAP and its purpose**

####  **CAPWAP in the OSI Model**

CAPWAP operates at the **Application Layer (Layer 7)** of the OSI model but encapsulates control and data messages over **UDP**, which is at the **Transport Layer (Layer 4)**
- **Control messages**: Sent over **UDP port 5246**
- **Data messages**: Sent over **UDP port 5247**
So, it spans Layer 4 to Layer 7, but logically it's considered an application-layer protocol
####  **Two Tunnels in CAPWAP**

1. **Control Tunnel (UDP 5246)**
   -  Used for **management and control traffic** between AP and controller
   - Includes: AP config, firmware, keepalives, radio settings
   - Often **secured with DTLS**
2. **Data Tunnel (UDP 5247)**
   -  Used for **actual client data traffic** (like internet browsing, etc.)
   - Optional: Used only in **centralized deployments**
   - Can be skipped in **local switching** mode

#### Summary Table
| Tunnel Type   | Port   | Purpose                         | Encrypted | Optional |
|---------------|--------|----------------------------------|-----------|----------|
| Control Tunnel| 5246   | AP management & configuration    | Yes (DTLS)| No       |
| Data Tunnel   | 5247   | Client data forwarding           | No        | Yes      |

### **4. Whats the difference between Lightweight APs and Cloud-based APs**
**Lightweight APs** rely on a **central controller (WLC)** for management and decision-making

**Cloud-based APs** are managed via the **internet** using a **cloud controller**, no on-prem WLC needed.

### **5. How the CAPWAP tunnel is maintained between AP and controller**
- **Heartbeat Messages** – Regular keepalive packets ensure both AP and controller are responsive
- **DTLS Encryption** – Control tunnel is protected with DTLS for secure communication  
- **Session Timers** – Track tunnel activity and detect failure or inactivity
- **Auto Recovery** – AP automatically reconnects to the controller if the tunnel breaks
   
All these ensure that the tunnel stays **secure, stable, and self-healing**
### **6. Whats the difference between Sniffer and monitor mode , use case for each mode**
#### Sniffer Mode  
- Captures traffic **only from a specific SSID/channel** 
- AP remains **connected to the controller**
- Used to **troubleshoot client issues**, capture packets, and debug encryption/authentication problems

#### Monitor Mode  
- Captures **all wireless traffic** across all channels
- AP works **independently**, not connected to the controller 
- Used for **RF analysis**, **rogue AP detection**, and **site surveys**

### **7. If WLC deployed in WAN, which AP mode is best for local network and how?**
**FlexConnect Mode** is the most suitable
- Enables APs to **locally switch client traffic**, avoiding WAN backhaul.  
- **Maintains wireless services** even if the WLC becomes unreachable.  
- Ideal for **branch or remote sites** with centralized WLC over WAN.
Ensures **efficient local traffic handling** and **WAN resilience**

### **8. What are challenges if deploying autonomous APs (more than 50) in large network like university**

- **No central management** – Each AP needs manual setup and updates  
- **Poor scalability** – Hard to manage 50+ APs efficiently  
- **No seamless roaming** – User disconnection while moving between APs  
- **Inconsistent policies** – Hard to apply uniform settings  
- **Troubleshooting is difficult** – No centralized logs or monitoring

Not ideal for large setups like universities which require the use of controller-based APs for better management
### **9.  What happens on wireless client connected to Lightweight AP in local mode if WLC goes down**
- **All client sessions drop** – AP loses control-plane connection to WLC 
- **No new client associations** – AP can’t authenticate new clients  
- **Ongoing traffic stops** – Data forwarding is dependent on WLC  
- **AP reboots or goes into recovery mode** – Waits to rejoin WLC

 **Local mode APs rely fully on WLC** — without it, they stop serving clients


