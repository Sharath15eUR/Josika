# System Administration Tasks

## Overview
This repository contains a set of system administration tasks that involve file management, process monitoring, networking, and text processing. The tasks are designed to help automate common Linux system operations and make the process more efficient.

## Assessment questions

### **1. List Files Larger than 1 MB**

#### i) Creating a file of 2MB with random content
```bash
head -c 2M </dev/urandom >largefile
```
#### ii) Command to find files greater than 1MB and storing in output1.txt
```bash
find . -type f -size +1M > output1.txt
```
#### iii) Screenshot
![1](https://github.com/user-attachments/assets/c3a80b50-f974-4794-b715-d83933e67c1b)

### **2. Replace localhost with 127.0.0.1 in a Config File**

#### i) Config.txt
``` text
server = localhost
database_host = localhost
port = 3306
api_url = http://localhost:8080
log_path = /var/log/localhost
timeout = 30
```
#### ii) Command to replace all occurrences of localhost with 127.0.0.1 in config.txt and save the updated file as output2.txt
```bash
sed 's/localhost/127.0.0.1/g' config.txt > output2.txt
```
#### iii) Output2.txt
```bash
server = localhost
database_host = localhost
port = 3306
api_url = http://localhost:8080
log_path = /var/log/localhost
timeout = 30
```
#### iv) Screenshot
![2](https://github.com/user-attachments/assets/574cbb35-6c9a-44f1-83bd-0c8faecf4862)

### **3. Filter Lines Containing "ERROR" in a Log File**

#### i) To search for lines containing the word ERROR while excluding lines containing DEBUG in a log file, and save the results to output3.txt
```bash
 grep "ERROR" log.txt | grep -v "DEBUG" > output3.txt
```
#### ii) Screenshot
![3](https://github.com/user-attachments/assets/19b58617-bb48-4df5-a2b2-667b32f8f434)

### **4. Identify and Terminate the Process with Highest Memory Usage**

#### i) To list processes sorted by memory usage (show top 20)
```bash
 top -b -n 1 | head -n 20
```
#### ii) To terminate the process with the highest memory
```bash
kill -9 <PID>
```
#### iii) Screenshot
![4-part1](https://github.com/user-attachments/assets/f81d1434-c01c-4d71-a2db-85cd2776ff53)
![4-part2](https://github.com/user-attachments/assets/3982b2e4-11ca-4734-a614-f1c87dcb5d74)

### **5. List All Available Gateways Sorted**

#### i) To list all available gateways and display them in a sorted manner
```bash
ip route | grep default |awk '{print $3}'| sort -u
```
#### ii) Screenshot
![5](https://github.com/user-attachments/assets/a38fdfbf-05d1-4d23-9136-7747395e2099)

