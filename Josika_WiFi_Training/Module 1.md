### **1. In which OSI layer does the Wi-Fi standard/protocol fit?**

Wi-Fi operates at both **Layer 1 (Physical Layer)** and **Layer 2 (Data Link Layer)** of the OSI model

#### Physical Layer (Layer 1)
- Wi-Fi uses **radio waves** to transmit and receive data
- Standards like **802.11a/b/g/n/ac/ax** define the physical characteristics such as:
  - Frequencies
  - Modulation techniques
  - Transmission power

#### Data Link Layer (Layer 2)
- Specifically, it functions in the **MAC (Media Access Control)** sublayer of Layer 2
- The **802.11 MAC protocol** manages:
  - How devices access the wireless medium
  - Handling of collisions
  - Authentication
- Implements features like:
  - **CSMA/CA** (Carrier Sense Multiple Access with Collision Avoidance)
  - **Encryption protocols** (WPA2, WPA3)
  - **Frame management**

### **2. Day-to-Day Wi-Fi Devices & Their Wireless Capabilities** 


The **Wi-Fi devices** that I use daily along with their wireless properties and generations 

#### **1. Smartphone – Oppo F25**  
- **Wi-Fi Generation:** **Wi-Fi 5 (802.11ac)**  
- **Maximum Speed:** **Up to 3.5 Gbps**  
- **Frequency Bands:** **2.4 GHz & 5 GHz**  
- **MIMO Support:** **Yes** (better speed & stability)  
- **Use Case:** Browsing, streaming, gaming, video calls  

#### **2. Laptop – HP**  
*(Wi-Fi version depends on the model, but generally HP laptops support Wi-Fi 5 or Wi-Fi 6)*  

- **Wi-Fi Generation:** **Wi-Fi 5 (802.11ac) or Wi-Fi 6 (802.11ax)**  
- **Maximum Speed:** **Up to 9.6 Gbps (Wi-Fi 6)**  
- **Frequency Bands:** **2.4 GHz, 5 GHz, (6 GHz for Wi-Fi 6E models)**  
- **MIMO Support:** **Yes**  
- **Use Case:** Online work, video conferencing, coding, gaming  

#### **3. Router – Jio (JioFiber Wi-Fi Router)**  
- **Wi-Fi Generation:** **Wi-Fi 5 (802.11ac) or Wi-Fi 6 (802.11ax) (Depends on the model)**  
- **Maximum Speed:** **Up to 1 Gbps (JioFiber plans)**  
- **Frequency Bands:** **Dual-band (2.4 GHz & 5 GHz)**  
- **MIMO Support:** **Yes** (Allows multiple devices to connect efficiently)  
- **Use Case:** Home internet, multiple device connectivity, gaming, streaming  

#### **Matching Devices to Wi-Fi Generations**  

| **Device**          | **Wi-Fi Generation** | **Max Speed** | **Frequency Bands** |
|--------------------|-------------------|-------------|----------------|
| **Oppo F25**       | Wi-Fi 5 (802.11ac) | Up to 3.5 Gbps | 2.4 GHz, 5 GHz |
| **HP Laptop**      | Wi-Fi 5 / Wi-Fi 6  | Up to 9.6 Gbps | 2.4 GHz, 5 GHz, (6 GHz for Wi-Fi 6E) |
| **Jio Router**     | Wi-Fi 5 / Wi-Fi 6  | Up to 1 Gbps (depends on ISP) | 2.4 GHz, 5 GHz |


### **3. What is BSS and ESS?**
- **BSS (Basic Service Set)**: A single access point (AP) with associated devices forming a small Wi-Fi network 
  Example: Home Wi-Fi router and connected devices  
- **ESS (Extended Service Set)**: A group of multiple APs interconnected, allowing seamless roaming between them 
  Example: Wi-Fi networks in large offices, airports, and universities

### **4. Basic Functionalities of a Wi-Fi Access Point**
A **Wi-Fi Access Point (AP)** provides wireless connectivity to client devices by:  
- Transmitting & Receiving Wi-Fi signals (2.4 GHz, 5 GHz, 6 GHz)
- Assigning IP addresses (via DHCP)
- Ensuring secure access (WPA2/WPA3 encryption)  
- Providing seamless roaming (in Enterprise Wi-Fi)  
- Traffic management via QoS (Quality of Service)


### **5. Bridge Mode vs Repeater Mode**
| **Mode** | **Functionality** | **Use Case** |
|----------|----------------|------------|
| **Bridge Mode** | Connects two separate networks, extending wired-to-wireless connectivity| Offices, interconnecting two LANs |
| **Repeater Mode** | Amplifies and extends the Wi-Fi signal of an existing network | Extending home Wi-Fi coverage|


### **6. Differences between 802.11a and 802.11b**
| **Feature** | **802.11a** | **802.11b** |
|------------|-----------|-----------|
| **Frequency** | 5 GHz | 2.4 GHz |
| **Max Speed** | 54 Mbps | 11 Mbps |
| **Interference** | Less interference | More interference |
| **Use Case** | Enterprise & business networks | Home networks |


### **7. Configure your modem/hotspot to operate only in 2.4Ghz and connect your laptop/Wi-Fi device , and capture the capability/properties in your Wi-Fi device. Repeat the same in 5Ghz and tabulate all the differences you observed during this**

### **8. Differences between IEEE and WFA**
| **Feature** | **IEEE (Institute of Electrical and Electronics Engineers)** | **WFA (Wi-Fi Alliance)** |
|------------|-------------------------------------|-------------------------|
| **Purpose** | Defines **Wi-Fi standards** (e.g., 802.11) | Certifies Wi-Fi products for interoperability |
| **Regulation** | Establishes Wi-Fi protocols | Ensures compliance with standards |

### **9. List down the type of Wi-Fi internet connectivity backhaul, share your home/college's wireless internet connectivity backhaul name and its properties**
Backhaul is the connection between Access Points (APs) and the Internet
- **Fiber Backhaul** – Fast, low latency
- **Ethernet Backhaul** – Wired connection, stable
- **Wireless (Microwave) Backhaul** – Used in rural areas
- **Satellite Backhaul** – Used in remote locations

**Example:** My college uses Ethernet backhaul for Wi-Fi

**Properties of Ethernet backhaul:**  
- **Stable & Reliable** – Consistent connection 
- **High Speed** – Supports 1 Gbps or more
- **Low Latency** – Minimal delays 
- **Wired** – Uses Ethernet cables  
- **Secure** – Less interference

### **10. List down the Wi-Fi topologies and use cases of each one**
#### **Wi-Fi Topologies and Their Use Cases**  

1. **Infrastructure Mode**  
   - **Use Case:** Common in homes, offices, and public Wi-Fi networks 
   - **Description:** Devices connect to a central Wi-Fi router or access point (AP) for internet access

2. **Ad-hoc Mode (Peer-to-Peer)**  
   - **Use Case:** Temporary networks, file sharing, or device-to-device communication without a router 
   - **Description:** Devices connect directly to each other without an access point

3. **Mesh Network**  
   - **Use Case:** Large homes, campuses, smart cities, and industrial IoT
   - **Description:** Multiple nodes (APs) work together, providing seamless coverage and self-healing connections  

4. **Wireless Distribution System (WDS)**  
   - **Use Case:** Extending Wi-Fi coverage without additional cables in businesses and large buildings
   - **Description:** APs communicate wirelessly to extend the network range 

5. **Hotspot Mode**  
   - **Use Case:** Public Wi-Fi in cafes, airports, hotels, and mobile networks
   - **Description:** A device (router or smartphone) shares internet access with others 

