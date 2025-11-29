# 📊 Fair Work Division - Team Theta
## COSC/ITAP 3411 - Scheduled Listener Project

---

## 👥 **DETAILED CONTRIBUTION BREAKDOWN**

### **Student 1: Script Foundation & Input Validation** ⚙️

**Responsibilities:**
1. ✅ Write shebang line and initial comments
2. ✅ Create welcome banner (lines 1-15)
3. ✅ Implement port number input with `read -p`
4. ✅ Write complete port validation logic:
   - Empty input check
   - Port range validation (1024-65535)
   - Root privilege warning for low ports
   - Error handling with exit codes
5. ✅ Test all validation scenarios
6. ✅ Ensure user-friendly error messages

**Code Lines Owned:** Lines 1-42 (approximately 42 lines)

**Time Estimate:** 3-4 hours

**Deliverables:**
- Working input validation module
- Test cases for validation
- Contribution to presentation (3 minutes)

---

### **Student 2: Scheduling Logic & Netcat Integration** 🕒

**Responsibilities:**
1. ✅ Create scheduling options menu (lines 43-51)
2. ✅ Implement Option 1 (Immediate listener):
   - Display status messages
   - Execute netcat command
   - Show connection instructions
3. ✅ Implement Option 2 (Delayed start):
   - Read delay time
   - Create countdown with while loop
   - Display time remaining
   - Start listener after delay
4. ✅ Implement Option 3 (Continuous loop):
   - Read interval time
   - Create infinite while loop
   - Auto-restart functionality
   - Track attempt numbers
5. ✅ Integrate all netcat commands properly
6. ✅ Test each scheduling mode

**Code Lines Owned:** Lines 43-160 (approximately 117 lines)

**Time Estimate:** 4-5 hours

**Deliverables:**
- All three scheduling modes working
- Netcat integration complete
- Contribution to presentation (3 minutes)

---

### **Student 3: Error Handling, Testing & Debugging** 🐛

**Responsibilities:**
1. ✅ Review entire script for error scenarios
2. ✅ Add error handling for all user inputs
3. ✅ Create comprehensive test plan:
   - Valid inputs
   - Invalid inputs
   - Edge cases
   - Network scenarios
4. ✅ Execute all test cases and document results
5. ✅ Create troubleshooting guide
6. ✅ Debug any issues found during testing
7. ✅ Improve user feedback messages
8. ✅ Add status indicators (ACTIVE, WAITING, etc.)

**Testing Matrix:**
```
Test #1: Valid port 4444 → ✓ Pass
Test #2: Port 70000 → ✓ Error caught
Test #3: Port 80 with root → ✓ Warning shown
Test #4: Empty input → ✓ Error caught
Test #5: Invalid choice (5) → ✓ Error caught
Test #6: Delayed mode (10s) → ✓ Works correctly
Test #7: Loop mode → ✓ Auto-restarts
Test #8: Connection test → ✓ Shell access confirmed
```

**Time Estimate:** 3-4 hours

**Deliverables:**
- Test report with all scenarios
- Bug fixes implemented
- Troubleshooting documentation
- Contribution to presentation (3 minutes)

---

### **Student 4: Documentation, GitHub & Presentation** 📝

**Responsibilities:**
1. ✅ Write comprehensive README.md:
   - Project description
   - Installation instructions
   - Usage examples (all three modes)
   - Troubleshooting section
   - Security disclaimer
2. ✅ Add inline code comments throughout script
3. ✅ Set up GitHub repository:
   - Create repo structure
   - Upload all files
   - Write proper commit messages
4. ✅ Create presentation materials:
   - Slide deck (13 slides)
   - Presentation script for all members
   - Demo preparation guide
5. ✅ Record demo video (backup)
6. ✅ Compile final submission package

**Documentation Checklist:**
- [x] README with all sections
- [x] Code comments (every 3-5 lines)
- [x] Installation guide
- [x] Usage examples
- [x] Troubleshooting tips
- [x] Presentation slides
- [x] GitHub repo organized
- [x] Submission ready

**Time Estimate:** 4-5 hours

**Deliverables:**
- Complete README.md
- Commented codebase
- GitHub repository
- Presentation materials
- Live demo preparation
- Contribution to presentation (3 minutes)

---

## 📅 **SUGGESTED TIMELINE**

### **Week 1 (Nov 10-16): Planning & Foundation**
- **Day 1-2:** Team meeting, role assignment
- **Day 3-4:** Student 1 works on input validation
- **Day 5-7:** Student 2 starts scheduling logic

### **Week 2 (Nov 17-23): Implementation**
- **Day 1-3:** Student 2 completes scheduling modes
- **Day 4-5:** Integration testing by Student 3
- **Day 6-7:** Student 4 begins documentation

### **Week 3 (Nov 24-30): Finalization**
- **Day 1-2:** All testing complete (Student 3)
- **Day 3-4:** Documentation finalized (Student 4)
- **Day 5:** GitHub setup and upload
- **Day 6:** Presentation practice (all)
- **Day 7:** Final submission ✅

---

## 🔧 **SETUP INSTRUCTIONS FOR EACH STUDENT**

### **Initial Setup (All Students):**

```bash
# 1. Create working directory
cd ~
mkdir -p myShellScripts
cd myShellScripts

# 2. Clone or create project structure
mkdir Theta
cd Theta

# 3. Create the script file
touch scheduled_listener.sh

# 4. Give execute permission
chmod +x scheduled_listener.sh

# 5. Open in editor
nano scheduled_listener.sh
# or
mousepad scheduled_listener.sh &
```

### **For Testing (Student 3):**

```bash
# Set up two VMs or machines

# VM1 (Target Machine):
# - IP: 192.168.1.100
# - Run: ./scheduled_listener.sh

# VM2 (Attacker Machine):
# - IP: 192.168.1.200  
# - Run: nc 192.168.1.100 4444

# Network Check:
ping 192.168.1.100  # From VM2 to VM1

# Port Check:
sudo netstat -tulpn | grep 4444  # Check if port is listening
```

### **For GitHub (Student 4):**

```bash
# Initialize repository
git init
git remote add origin https://github.com/ITAP/COSC-3411/Theta.git

# Add files
git add scheduled_listener.sh
git add README.md
git add presentation/

# Commit
git commit -m "Initial commit - Scheduled Listener Project"

# Push
git push -u origin main
```

---

## 🎯 **QUALITY CHECKLIST**

### **Code Quality (Student 1 & 2):**
- [ ] Shebang line present: `#!/bin/bash`
- [ ] All variables lowercase (user-defined)
- [ ] No spaces around `=` in assignments
- [ ] Proper indentation (4 spaces or 1 tab)
- [ ] All commands from course slides only
- [ ] `read -p` for all user input
- [ ] `if [ condition ]; then` syntax correct
- [ ] Comparison operators correct (`-eq`, `-lt`, `-gt`)
- [ ] Loops properly structured
- [ ] Netcat command with all flags: `nc -lvp PORT -e /bin/bash`

### **Error Handling (Student 3):**
- [ ] Empty input checked with `[ -z "$var" ]`
- [ ] Port range validated (1024-65535)
- [ ] Delay time validated
- [ ] Interval time validated
- [ ] Invalid choice caught
- [ ] Clear error messages displayed
- [ ] Script exits with `exit 1` on errors
- [ ] All edge cases tested

### **Documentation (Student 4):**
- [ ] README has all sections
- [ ] Installation steps clear
- [ ] Usage examples provided
- [ ] Code has inline comments every 3-5 lines
- [ ] Major sections have header comments
- [ ] Security disclaimer included
- [ ] Troubleshooting guide complete
- [ ] GitHub repo properly structured

### **Presentation (All):**
- [ ] Timing: 12-15 minutes total
- [ ] Each student speaks 3 minutes
- [ ] Demo prepared and tested
- [ ] Slides clear and readable
- [ ] Questions anticipated
- [ ] Backup plan if demo fails

---

## 🛠️ **TOOLS & RESOURCES**

### **Required Software:**
```
✓ Bash Shell (pre-installed on Linux)
✓ Netcat (nc command)
✓ Text editor (nano, vim, or mousepad)
✓ Git (for version control)
```

### **Installation Commands:**
```bash
# Install netcat (if missing)
sudo apt-get update
sudo apt-get install netcat

# Install git (if missing)
sudo apt-get install git

# Verify installations
which bash    # Should show /bin/bash
which nc      # Should show /usr/bin/nc or /bin/nc
which git     # Should show /usr/bin/git
```

### **Helpful Commands:**
```bash
# Check script syntax without running
bash -n scheduled_listener.sh

# Run script in debug mode
bash -x scheduled_listener.sh

# Check file permissions
ls -l scheduled_listener.sh

# Find process using port
sudo lsof -i :4444

# Kill process on port
sudo kill -9 <PID>

# Check network connectivity
ping <target_ip>
netstat -tulpn | grep 4444
```

---

## 📖 **LEARNING RESOURCES**

### **From Course Slides:**
- ✓ Read command (slide 5-6)
- ✓ Variables (slide 8-9)
- ✓ If/else/elif (slide 12-15)
- ✓ Loops (slide 32-40)
- ✓ Netcat usage (slide 18-25)
- ✓ Special variables (slide 10)

### **Additional Practice:**
```bash
# Practice read command
read -p "Test: " test
echo $test

# Practice conditionals
if [ 5 -gt 3 ]; then echo "yes"; fi

# Practice loops
for i in {1..5}; do echo $i; done

# Practice netcat
# Terminal 1: nc -lvp 9999
# Terminal 2: nc localhost 9999
```

---

## ⚠️ **COMMON MISTAKES TO AVOID**

### **Syntax Errors:**
```bash
# ❌ WRONG: Space around =
port = 4444

# ✅ CORRECT: No space
port=4444

# ❌ WRONG: Missing spaces in test
if [$x -eq 5]; then

# ✅ CORRECT: Spaces required
if [ $x -eq 5 ]; then

# ❌ WRONG: Using quotes in numbers
if [ "$port" -gt "1024" ]; then

# ✅ CORRECT: No quotes for numbers
if [ $port -gt 1024 ]; then
```

### **Logic Errors:**
```bash
# ❌ WRONG: Comparing strings with -eq
if [ $x -eq $y ]; then  # Only for numbers

# ✅ CORRECT: Use = for strings
if [ "$x" = "$y" ]; then

# ❌ WRONG: Forgetting $ before variables
if [ port -gt 1024 ]; then

# ✅ CORRECT: Use $ to reference
if [ $port -gt 1024 ]; then
```

### **Netcat Errors:**
```bash
# ❌ WRONG: Missing flags
nc 4444

# ✅ CORRECT: Proper listener
nc -lvp 4444 -e /bin/bash

# ❌ WRONG: Port already in use
# (Script will fail)

# ✅ CORRECT: Check first
sudo lsof -i :4444
```

---

## 🎓 **GRADING EXPECTATIONS**

### **A+ (95-100%):**
- All features work perfectly
- Code follows slides exactly
- Comprehensive documentation
- Professional presentation
- No errors in demo
- Equal team contribution

### **A (90-94%):**
- All features work
- Minor syntax variations
- Good documentation
- Clear presentation
- Demo mostly successful
- Team contributions clear

### **B (80-89%):**
- Core features work
- Some documentation missing
- Adequate presentation
- Demo has minor issues
- Team contributions uneven

**Our Target: 100% 🎯**

---

## 💬 **COMMUNICATION PLAN**

### **Team Meetings:**
```
Week 1: Planning meeting (1 hour)
- Assign roles
- Discuss timeline
- Set up development environment

Week 2: Progress check (30 min)
- Review Student 1 & 2 work
- Discuss any blockers
- Plan integration

Week 3: Final meeting (1 hour)
- Review complete project
- Practice presentation
- Final testing
```

### **Contact Methods:**
- WhatsApp group for quick questions
- Shared Google Doc for documentation
- GitHub for code collaboration
- Zoom for meetings (if remote)

---

## 🚀 **FINAL PRE-SUBMISSION CHECKLIST**

### **48 Hours Before Deadline:**
- [ ] Script tested on clean VM
- [ ] All team members reviewed code
- [ ] README proofread
- [ ] GitHub repo organized
- [ ] Presentation rehearsed once

### **24 Hours Before Deadline:**
- [ ] Final code review
- [ ] Documentation complete
- [ ] Demo environment prepared
- [ ] Backup video recorded
- [ ] All files uploaded to GitHub

### **Submission Day:**
- [ ] Verify GitHub repo accessible
- [ ] Confirm all files present
- [ ] Test demo one more time
- [ ] Arrive early for presentation
- [ ] Bring backup USB drive

---

## 🏆 **SUCCESS CRITERIA**

✅ **Technical:**
- Script runs without errors
- All three modes function correctly
- Netcat listener works
- Error handling robust

✅ **Documentation:**
- README comprehensive
- Code well-commented
- Examples clear
- Troubleshooting helpful

✅ **Presentation:**
- Within time limit (12-15 min)
- All members participate equally
- Demo successful
- Questions handled well

✅ **Teamwork:**
- Fair work distribution
- Good communication
- Mutual support
- Professional collaboration

---

## 📬 **CONTACT & SUPPORT**

**If you have questions:**

1. **Check course slides first** (most answers there)
2. **Review this documentation** (comprehensive guide)
3. **Ask team members** (peer support)
4. **Consult instructor** (during office hours)

**Emergency Contacts:**
- Team Leader: [WhatsApp group]
- Instructor: [Course portal]
- TA: [Office hours]

---

## 🎉 **FINAL MOTIVATION**

Dear Team Theta,

You have everything you need to achieve a perfect score:

✓ **Clear script** following course standards
✓ **Comprehensive documentation** with examples
✓ **Detailed presentation guide** with timing
✓ **Fair work division** for all members
✓ **Testing plan** to ensure quality

**Remember:**
- Work consistently (don't leave for last day)
- Communicate regularly with team
- Test thoroughly before submission
- Practice presentation together
- Support each other

**You've got this! Make it happen! 🚀**

---

**Project Completion Target:** November 30, 2025  
**Expected Grade:** 100/100  
**Team:** Theta 💪

**"Excellence is not an act, but a habit." - Aristotle**

Good luck! 🍀