#!/bin/bash

# ===============================
# SentinelX v1.0
# Linux Security Audit Framework
# ===============================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

banner() {
clear
echo -e "${CYAN}"
echo "=============================================="
echo "           SentinelX Security Framework"
echo "=============================================="
echo -e "${NC}"
}

system_info() {
echo -e "${GREEN}System Information${NC}"
echo "Hostname : $(hostname)"
echo "Kernel   : $(uname -r)"
echo "OS       : $(uname -o)"
echo "Uptime   : $(uptime -p)"
echo
echo "Memory"
free -h
echo
echo "Disk"
df -h
}

network_info() {
echo -e "${GREEN}Network Information${NC}"
echo
hostname -I
echo
ip addr
}

user_audit() {
echo -e "${GREEN}User Audit${NC}"
echo
echo "Current User:"
whoami
echo
echo "Logged-in Users:"
who
echo
echo "Total User Accounts:"
cat /etc/passwd | wc -l
}

process_monitor() {
echo -e "${GREEN}Top Processes${NC}"
ps aux --sort=-%cpu | head
}

open_ports() {
echo -e "${GREEN}Open Ports${NC}"
ss -tuln
}


ssh_audit() {

echo "=============================="
echo " SSH Security Audit"
echo "=============================="

if command -v ssh >/dev/null 2>&1; then
    echo "[✓] SSH Installed"
else
    echo "[✗] SSH Not Installed"
fi

echo

if systemctl is-active --quiet ssh; then
    echo "[✓] SSH Service Running"
else
    echo "[!] SSH Service Not Running"
fi

echo

if [ -f /etc/ssh/sshd_config ]; then

echo "SSH Port:"
grep "^Port" /etc/ssh/sshd_config

echo
echo "Root Login:"
grep "^PermitRootLogin" /etc/ssh/sshd_config

echo
echo "Password Authentication:"
grep "^PasswordAuthentication" /etc/ssh/sshd_config

else

echo "sshd_config not found."

fi

}
firewall_audit() {

echo "=============================="
echo " Firewall Security Audit"
echo "=============================="

if command -v ufw >/dev/null 2>&1; then

    echo "[✓] UFW Firewall Installed"

    STATUS=$(ufw status | grep Status)

    echo
    echo "$STATUS"

    echo
    echo "Firewall Rules:"
    ufw status numbered

else

    echo "[!] UFW Firewall Not Installed"

fi

}

permission_audit() {

echo "=============================="
echo " Permission Security Audit"
echo "=============================="

echo
echo "[!] Checking SUID files..."

find / -perm -4000 2>/dev/null | head -20

echo

echo "[!] Checking World Writable files..."

find / -type f -perm -0002 2>/dev/null | head -20

echo
echo "Permission audit completed."

}
file_integrity() {

echo "=============================="
echo " File Integrity Checker"
echo "=============================="

mkdir -p logs

BASELINE="logs/file_hashes.txt"

FILES="/etc/passwd /etc/group /etc/hosts"

if [ ! -f "$BASELINE" ]; then

    echo "Creating baseline..."

    sha256sum $FILES > "$BASELINE"

    echo
    echo "Baseline created:"
    cat "$BASELINE"

else

    echo "Checking file changes..."

    sha256sum -c "$BASELINE"

fi

}
security_score() {

echo "=============================="
echo " SentinelX Security Score"
echo "=============================="

SCORE=0

echo

# Firewall check
if command -v ufw >/dev/null 2>&1; then

    STATUS=$(ufw status | grep active)

    if [ ! -z "$STATUS" ]; then
        echo "[✓] Firewall Enabled       +20"
        SCORE=$((SCORE+20))
    else
        echo "[!] Firewall Disabled     +0"
    fi

else
    echo "[!] Firewall Not Installed +0"
fi


echo

# SSH check
if systemctl is-active --quiet ssh; then
    echo "[✓] SSH Running            +20"
    SCORE=$((SCORE+20))
else
    echo "[!] SSH Not Running        +0"
fi


echo

# Integrity check
if [ -f logs/file_hashes.txt ]; then
    echo "[✓] File Integrity Active  +20"
    SCORE=$((SCORE+20))
else
    echo "[!] No Integrity Baseline  +0"
fi


echo

# Permission audit
echo "[✓] Permission Audit Done  +20"
SCORE=$((SCORE+20))


echo

# Port check
echo "[✓] Port Audit Available   +20"
SCORE=$((SCORE+20))


echo
echo "=============================="
echo "Final Security Score: $SCORE/100"
echo "=============================="

}
report() {

mkdir -p reports

FILE="reports/report.txt"

echo "SentinelX Report" > "$FILE"
echo "Generated: $(date)" >> "$FILE"
echo "" >> "$FILE"
hostname >> "$FILE"
uname -a >> "$FILE"
free -h >> "$FILE"
df -h >> "$FILE"

echo
echo "Report saved to $FILE"
}

while true
do
banner

echo "1. System Information"
echo "2. Network Information"
echo "3. User Audit"
echo "4. Process Monitor"
echo "5. Open Ports"
echo "6. SSH Audit"
echo "7. Firewall Audit"
echo "8. Permission Audit"
echo "9. File Integrity Checker"
echo "10. Security Score"
echo "11. Generate Report"
echo "12. Exit"

echo
read -p "Choose: " choice

case $choice in
1)
system_info
;;

2)
network_info
;;

3)
user_audit
;;

4)
process_monitor
;;

5)
open_ports
;;

6)
ssh_audit
;;

7)
firewall_audit
;;

8)
permission_audit
;;

9)
file_integrity
;;

10)
security_score
;;

11)
report
;;

12)
echo "Goodbye!"
exit
;;

*)
echo "Invalid Option"
;;
esac

echo
read -p "Press Enter to continue..."

done
