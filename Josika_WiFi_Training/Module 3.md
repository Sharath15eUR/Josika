### 1. What are the different 802.11 PHY layer standards? Compare their characteristics.

| Standard    | Frequency | Max Data Rate | Modulation         | Channel Width | Features                             |
|-------------|-----------|---------------|---------------------|----------------|----------------------------------------|
| 802.11a     | 5 GHz     | 54 Mbps       | OFDM                | 20 MHz         | Low interference                      |
| 802.11b     | 2.4 GHz   | 11 Mbps       | DSSS                | 22 MHz         | High range, low speed                 |
| 802.11g     | 2.4 GHz   | 54 Mbps       | OFDM (backward comp.)| 20 MHz        | Compatible with 802.11b              |
| 802.11n     | 2.4/5 GHz | 600 Mbps      | OFDM + MIMO         | 20/40 MHz      | Uses up to 4 spatial streams          |
| 802.11ac    | 5 GHz     | >1 Gbps       | OFDM, 256-QAM       | 20/40/80/160 MHz | Supports MU-MIMO                      |
| 802.11ax (Wi-Fi 6) | 2.4/5/6 GHz | >10 Gbps | OFDMA, 1024-QAM | 20 to 160 MHz | Higher efficiency, more users         |

### 2. What are DSSS and FHSS? How do they work?

- **DSSS (Direct Sequence Spread Spectrum)**:
  - Spreads data by multiplying it with a pseudorandom noise sequence (chip code).
  - Provides resistance to interference and jamming.
  - Used in 802.11b.

- **FHSS (Frequency Hopping Spread Spectrum)**:
  - Changes carrier frequency rapidly according to a pattern shared by sender/receiver.
  - Increases resistance to narrowband interference.
  - Used in earlier 802.11 versions.

### 3. How do modulation schemes work in the PHY layer?

- **Modulation** encodes digital data onto radio waves.
- It maps bits to signal changes (phase/amplitude/frequency).
  
### Common Modulation Types:

| Modulation | Bits/Symbol | Performance                     |
|------------|-------------|----------------------------------|
| BPSK       | 1           | Most robust, low data rate       |
| QPSK       | 2           | Moderate robustness & speed      |
| 16-QAM     | 4           | Higher data rate, less robust    |
| 64-QAM     | 6           | Used in 802.11n/ac               |
| 256-QAM    | 8           | Used in 802.11ac                 |
| 1024-QAM   | 10          | Used in 802.11ax (Wi-Fi 6)       |

Higher modulation gives higher speed but requires better SNR.

### 4. What is the significance of OFDM in WLAN? How does it improve performance?

- **OFDM (Orthogonal Frequency Division Multiplexing)**:
  - Splits the channel into many narrow subcarriers.
  - Each subcarrier carries part of the data stream.
  - Resistant to multipath fading and interference.
  - Improves spectral efficiency and speed.
  - Used in 802.11a/g/n/ac/ax.

### 5. How are frequency bands divided for Wi-Fi? Explain different bands and their channels.

- **2.4 GHz Band**:
  - 14 channels (only 1, 6, 11 are non-overlapping).
  - Longer range, more interference (used by many devices).

- **5 GHz Band**:
  - Over 25 channels.
  - Less interference, shorter range.
  - Allows for channel bonding (e.g., 40/80/160 MHz).

- **6 GHz Band (Wi-Fi 6E)**:
  - New band with up to 59 non-overlapping channels.
  - More capacity and higher throughput.

### 6. What is the role of Guard Intervals in WLAN transmission? How does a short Guard Interval improve efficiency?

- **Guard Interval (GI)**:
  - Time gap between symbols to avoid inter-symbol interference due to multipath.
  
- **Types**:
  - **Long GI**: 800 ns (standard)
  - **Short GI**: 400 ns

- **Short GI** improves data throughput (~10%) but requires clean signal conditions.

### 7. Describe the structure of an 802.11 PHY layer frame. What are its key components?

- **PHY Layer Frame (PPDU)** contains:
  - **PLCP Preamble**: Synchronizes transmitter and receiver.
  - **PLCP Header**: Includes rate, length, etc.
  - **PSDU (MAC Layer Data)**: Actual data payload.
  
Each Wi-Fi generation (legacy/HT/VHT/HE) may add specific fields.

### 8. What is the difference between OFDM and OFDMA?

| Feature        | OFDM                          | OFDMA                            |
|----------------|-------------------------------|----------------------------------|
| Use Case       | One user per transmission     | Multiple users simultaneously    |
| Subcarriers    | All assigned to one user      | Divided among multiple users     |
| Latency        | Higher                        | Lower                            |
| Efficiency     | Less efficient under many users | Highly efficient                 |
| Wi-Fi Version  | 802.11a/g/n/ac                | 802.11ax (Wi-Fi 6)               |

### 9. What is the difference between MIMO and MU-MIMO?

- **MIMO (Multiple Input, Multiple Output)**:
  - Multiple antennas for one user.
  - Increases speed and reliability.

- **MU-MIMO (Multi-User MIMO)**:
  - Multiple antennas serve multiple users simultaneously.
  - Enhances overall network capacity.

### 10. What are PPDU, PLCP, and PMD in the PHY layer?

- **PPDU (PHY Protocol Data Unit)**:
  - Complete frame sent by the PHY layer.
- **PLCP (Physical Layer Convergence Protocol)**:
  - Adds preamble and header; aligns MAC with PHY.
- **PMD (Physical Medium Dependent)**:
  - Handles actual transmission over air using modulation and antennas.

### 11. What are the types of PPDU? Explain the PPDU frame format across different Wi-Fi generations.

- **Legacy PPDU**: Used in 802.11a/b/g  
- **HT PPDU**: Used in 802.11n  
- **VHT PPDU**: Used in 802.11ac  
- **HE PPDU**: Used in 802.11ax (Wi-Fi 6)

### Format:
- **Preamble**: Synchronization
- **Header**: Rate, length, modulation info
- **Payload (PSDU)**: Actual data
- **Tail and padding** for OFDM alignment

### 12. How is the data rate calculated?

### Formula:
Data Rate = (Modulation Bits/Symbol) × (Coding Rate) × (Symbol Rate) × (Spatial Streams)
