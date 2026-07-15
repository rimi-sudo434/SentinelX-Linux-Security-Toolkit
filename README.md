# 🛡️ SentinelX

**SentinelX** is a lightweight Linux security auditing framework written entirely in **Bash Shell Script**. It helps users perform basic security assessments, system monitoring, and configuration checks directly from the Linux terminal.

The goal of SentinelX is to provide a simple command-line security toolkit that can collect important system information, identify potential security risks, and generate useful reports.

---

# 🚀 Features

## 🖥️ System Information Audit

Collects important details about the Linux system:

- Hostname information
- Operating system details
- Kernel version
- System uptime
- Memory usage
- Disk usage

---

## 🌐 Network Security Audit

Analyzes network-related information:

- IP address information
- Network interfaces
- Routing information
- Active network configuration

---

## 👥 User Audit

Checks user-related information:

- Current logged-in user
- Active user sessions
- Total user accounts
- User account details

---

## ⚙️ Process Monitoring

Displays running processes and helps identify resource-heavy applications:

- CPU usage
- Memory usage
- Process IDs
- Running commands

---

## 🔌 Open Port Detection

Checks active listening ports:

- Network services
- Open TCP/UDP ports
- Potential exposed services

---

## 🔐 SSH Security Audit

Performs basic SSH configuration checks:

- SSH installation status
- SSH service status
- SSH configuration availability
- Authentication settings

---

## 🔥 Firewall Audit

Checks Linux firewall configuration:

- Firewall availability
- Firewall status
- Active firewall rules

---

## 📂 Permission Security Audit

Searches for potentially risky file permissions:

- SUID files
- World-writable files
- Permission-related security risks

---

## 🔒 File Integrity Checker

Uses SHA-256 hashing to monitor important files.

Features:

- Creates a security baseline
- Stores file hashes
- Detects unauthorized modifications

Example:

```
/etc/passwd
SHA256: 07bfc9dbe5fff951a2b1d9d41a01f1b2e493e6c9a8f808859c9affa4dd1699f3
```

---

## 📊 Security Score

Provides a basic security posture evaluation.

Example:

```
==============================
 SentinelX Security Score
==============================

Firewall:
[✓] Enabled +20

SSH:
[✓] Running +20

File Integrity:
[✓] Active +20

Permission Audit:
[✓] Completed +20

Port Audit:
[✓] Available +20


Final Security Score: 100/100
```

---

## 📝 Report Generation

Generates security reports automatically.

Generated reports:

```
reports/report.txt
```

The report contains:

- System information
- Kernel details
- Memory information
- Disk information
- Security findings

---

# 📁 Project Structure

```
SentinelX/
│
├── sentinelx.sh
│
├── reports/
│   └── report.txt
│
├── logs/
│   └── file_hashes.txt
│
├── assets/
│
├── README.md
│
└── LICENSE
```

---

# 🛠️ Installation

## Clone Repository

```bash
git clone <repository-url>
```

Enter the project directory:

```bash
cd SentinelX
```

Give execution permission:

```bash
chmod +x sentinelx.sh
```

Run SentinelX:

```bash
./sentinelx.sh
```

---

# 📋 Usage

After starting SentinelX, the user can select different security modules:

Example:

```
==============================================
           SentinelX Security Framework
==============================================

1. System Information
2. Network Information
3. User Audit
4. Process Monitor
5. Open Ports
6. SSH Audit
7. Firewall Audit
8. Permission Audit
9. File Integrity Checker
10. Security Score
11. Generate Report
12. Exit

Choose:
```

---

# 💻 Example Output

## System Information

```
System Information

Hostname : linux-machine
Kernel   : 6.x.x
OS       : GNU/Linux
Uptime   : up 2 hours

Memory:

              total   used
RAM           8GB     3GB

Disk:

Filesystem     Size
/dev/sda1      100G
```

---

## Network Audit

```
Network Information

IP Address:
192.168.x.x

Network Interface:
wlan0
lo
```

---

## Process Monitor

```
Top Processes

USER     PID     CPU    MEM     COMMAND

user     2450    15%    5%      browser
user     1800    8%     2%      terminal
```

---

## Firewall Audit

```
Firewall Security Audit

[✓] UFW Firewall Installed

Status:
Status: active

Firewall Rules:
22/tcp ALLOW
80/tcp ALLOW
```

---

## File Integrity Check

First scan:

```
Creating baseline...

Baseline created:

/etc/passwd
/etc/group
/etc/hosts
```

Later scan:

```
Checking file changes...

/etc/passwd: OK
/etc/group: OK
/etc/hosts: OK
```

---

# 🎯 Future Improvements

Planned features:

- Advanced log analyzer
- Malware hash detection
- HTML security reports
- Email notifications
- Vulnerability scanning
- Better terminal dashboard
- Automated security recommendations

---

# 🔧 Technologies Used

- Bash Shell
- Linux Command Line Tools
- SHA-256 Hashing
- UFW Firewall
- Git & GitHub

---

# ⚠️ Disclaimer

SentinelX is created for educational purposes and authorized security auditing only.

Do not use security tools against systems without proper permission.

---

# 📜 License

This project is licensed under the MIT License.
